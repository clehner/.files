symlinks  = gitconfig
symlinks += gitignore
symlinks += gvimrc
symlinks += tmux.conf
symlinks += vim
symlinks += vimrc
symlinks += zsh
symlinks += zshrc

all: update-submodules

install: all $(symlinks)

clean:
	rm -f bin/getctime

update-submodules:
	git submodule update --init

$(symlinks):
	ln -sf ${PWD}/$@ ~/.$@

.PHONY: $(symlinks)
