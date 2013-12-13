#!/usr/bin/env perl

use strict;
use HTTP::Request;
use LWP::UserAgent;

my $city_code = 'USNY1232';
my $days = 4;
my $interval = 1800;

my $query = 'select item from weather.forecast where location="' . $city_code . '"';
my $request = HTTP::Request->new(GET =>
	'http://query.yahooapis.com/v1/public/yql?q=' . $query . '&format=json');

my @icons = qw(☀ ☁ ☂ ☃ ?);
my %codes;
$codes{$_} = 0 for qw(28 32 33 34 36);
$codes{$_} = 1 for qw(19 20 21 22 23 24 25 26 27 28 29 30 44);
$codes{$_} = 2 for qw(0 1 2 3 4 5 6 9 11 12 37 38 39 40 45 47);
$codes{$_} = 3 for qw(7 8 10 13 14 15 16 17 18 35 41 42 43 46);

sub get_icon {
	# Return an unicode icon based on the forecast code and text
	# See: http://developer.yahoo.com/weather/#codes
	my $code = shift;
	my $text = lc shift;

	# identify by code
	if (exists $codes{$code}) {
		$code = $codes{$code};

	# sun
	} elsif ($text =~ /sun/) {
		$code = 0;

	# cloud / early rain
	} elsif ($text =~ /cloud/) {
		$code = 1;

	# rain
	} elsif ($text =~ /rain/) {
		$code = 2;

	# snow
	} elsif ($text =~ /snow/) {
		$code = 3;

	# dunno
	} else {
		$code = -1;
	}

	return $icons[$code];
}

sub get_forecast {
	my $ua = LWP::UserAgent->new;
	my $response = $ua->request($request);
	if (!$response->is_success) {
		return '3ail';
	}
	#open FILE, "weather.json" or die "Couldn't open file: $!";
	#my $response = join("", <FILE>);
	#close FILE;

	# http://query.yahooapis.com/v1/public/yql?q=select%20item%20from%20weather.forecast%20where%20location=%22USNY1232%22&format=json

	my $json = $response->decoded_content;
	my ($temp, $forecast) = $json =~ /"temp":"(.*?)".*"forecast":(.*)/g;

	my $line = "$temp°";
	my @codes = $forecast =~ /"code":"(.*?)"/g;
	my @texts = $forecast =~ /"text":"(.*?)"/g;

	# reset today
	($texts[0]) = $json =~ /"text":"(.*?)"/;
	($codes[0]) = $json =~ /"code":"(.*?)"/;

	# return current temp + current today + 3 days forecast
	for my $i (0 .. $days-1) {
		my $code = $codes[$i];
		my $text = $texts[$i];
		#print 'code: ' . $code . ' text: ' . $text . "\n";
		$line .= ' ' . get_icon($code, $text);
	}
	print $line . "\n";
}

while(1) {
	get_forecast();
	sleep($interval);
}
