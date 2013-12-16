#!/bin/bash
#
# quota.sh
# i3bar-compatible quota checker
#
# © 2013 Charles Lehner, MIT License
#

color_good='#00FF00'
color_degraded='#FFFF00'
color_bad='#FF0000'

instance='~/../'
interval=60

echo '{"version":1}'
echo '['

# read quota
while true
do
	quota -w -f ~/.. | tail -1
	sleep $interval

done | while read device usage quota limit etc
do
	# trim '*'
	usage=${usage%*\*}

	# calculate free space
	(( free_space = (quota - usage) / 1024 ))

	# make a color
	if (( free_space > 0 ))
	then
		color="$color_good"
	elif (( usage < limit ))
	then
		color="$color_degraded"
	else
		color="$color_bad"
	fi

	# add unit
	free_space="$free_space M"

	# output in json format
	echo '[{"name":"quota","instance":"'$instance'","full_text":"'$free_space'","color":"'$color'"}],'
done

echo ']'
