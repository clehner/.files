JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
SCALA_HOME=/opt/local/share/scala-2.8

# MacPorts
PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH

PATH="$HOME/bin:$PATH"

export EDITOR=vim

# emacs keybindings
bindkey -e

# expand prompt
setopt PROMPT_SUBST

# CD into directories by just typing the directory
setopt autocd

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
setopt hist_verify # confirm substitutions
setopt share_history # share between concurrent sessions
# setopt hist_ignore_all_dups # ignore duplicates
setopt hist_reduce_blanks

# prompt with VCS information
autoload -Uz vcs_info && vcs_info

typeset -A COLOR
COLOR=(
	base03  $'%{\e[38;5;234m%}'
	base02  $'%{\e[38;5;235m%}'
	base01  $'%{\e[38;5;240m%}'
	base00  $'%{\e[38;5;241m%}'
	base0   $'%{\e[38;5;244m%}'
	base1   $'%{\e[38;5;245m%}'
	base2   $'%{\e[38;5;254m%}'
	base3   $'%{\e[38;5;230m%}'
	yellow  $'%{\e[38;5;136m%}'
	orange  $'%{\e[38;5;166m%}'
	red     $'%{\e[38;5;160m%}'
	magenta $'%{\e[38;5;125m%}'
	violet  $'%{\e[38;5;61m%}'
	blue    $'%{\e[38;5;33m%}'
	cyan    $'%{\e[38;5;37m%}'
	green   $'%{\e[38;5;64m%}'

	bold    $'%{\e[1m%}'
	no-bold $'%{\e[22m%}'
	reset   $'%{\e[0m%}'
)

zstyle ':vcs_info:*' enable git

precmd () { vcs_info }

zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' formats '%r' '/%S' '%b'
zstyle ':vcs_info:*' actionformats '%r' '/%S' '%b|%a'

PS1=''                                             # NON-GIT  GIT
PS1+='$COLOR[red]$vcs_info_msg_0_'                 #          repo name
PS1+='$COLOR[orange]${${vcs_info_msg_1_:-%~}:#/.}' # path     subdir
PS1+='$COLOR[reset]${vcs_info_msg_2_:+@}'          #          @
PS1+='$COLOR[blue]$vcs_info_msg_2_'                #          branch
PS1+='$COLOR[reset]%# '                            # % or #   % or #

RPS1=$'%{\e[0m%}$(date "+[%H:%M:%S]")'

chpwd () {
	# set the terminal title to the CWD
	print -Pn '\e]0;${PWD/$HOME/~}\a'
}
chpwd

# report time for long running jobs
REPORTTIME=5
TIMEFMT=$'\e[38;5;125mtime for %J:\e[0m %E real %U user %S system %P'

# The following lines were added by compinstall

zstyle ':completion:*' expand suffix
zstyle ':completion:*' format 'Completing %d...'
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*' 'm:{[:lower:]}={[:upper:]} l:|=* r:|=*'
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/kassens/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
