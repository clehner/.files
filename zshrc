alias port-selfupdate='sudo port selfupdate && port list outdated \
  && say port selfupdate completed'
alias port-upgrade='sudo port -u upgrade outdated && say port upgrade completed'

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export SCALA_HOME=/opt/local/share/scala-2.9

# MacPorts
path=(/opt/local/bin /opt/local/sbin /usr/local/mysql/bin $path)

path=(~/bin $path)

# autoload all functions in ~/.zsh/functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

export EDITOR=vim

# emacs keybindings
bindkey -e

bindkey ' ' magic-space # expand history with space

# CD into directories by just typing the directory
setopt autocd

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
setopt hist_verify # confirm substitutions
setopt share_history # share between concurrent sessions
setopt hist_reduce_blanks # compress whitespace
setopt hist_ignore_all_dups # ignore duplicates

# prompt with VCS information
function () {
  # expand prompt
  setopt PROMPT_SUBST

  autoload -Uz vcs_info && vcs_info

  solarized-init
  # wrap colors in %{ and %} pairs and assign to local vars
  for name in ${(k)solarized}; do
    eval "typeset $name='%{${solarized[$name]}%}'"
  done

  PS1=''                                        # NON-GIT  GIT
  PS1+="$red\$vcs_info_msg_0_"                  #          repo name
  PS1+="$orange\${\${vcs_info_msg_1_:-%~}:#/.}" # path     subdir
  PS1+="$reset\${vcs_info_msg_2_:+@}"           #          @
  PS1+="$blue\$vcs_info_msg_2_"                 #          branch
  PS1+="$reset%# "                              # % or #   % or #

  RPS1="\$(date '+[%H:%M:%S]')"
  precmd () { vcs_info }
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' max-exports 3
  zstyle ':vcs_info:*' formats '%r' '/%S' '%b'
  zstyle ':vcs_info:*' actionformats '%r' '/%S' '%b|%a'
}

# set the terminal title to the CWD
chpwd () {
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
