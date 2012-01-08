symlinks=gitignore gvimrc vim vimrc zsh zshrc

all: update-submodules

install: all $(symlinks)

clean:
	rm -f bin/getctime

update-submodules:
	git submodule update --init

$(symlinks):
	ln -sfh ${PWD}/$@ ~/.$@

.PHONY: $(symlinks)
