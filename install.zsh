#!/bin/zsh
cd ${0:h}

function show () {
  print $*
  $*
}

# update submodules
show git submodule update --init

# install symlinks in ~
links=(
  vim
  vimrc
  gvimrc
  zshrc
  git-completion.sh
)

for link in $links; do
  source=$PWD/$link
  target=~/.$link
  if [[ -L $target ]]; then
    rm $target
  elif [[ -a $target ]]; then
    print "Target $target exists and is not a symlink, aborting."
    exit
  fi
  show ln -s $source $target
done
