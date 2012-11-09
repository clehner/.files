symlinks = \
	gitconfig \
	gitignore \
	screenrc \
	tmux.conf \
	vim \
	gvimrc \
	vimrc \
	ssh/authorized_keys \
	ssh/config

all: update-submodules

install: all $(symlinks)

update-submodules:
	git submodule update --init

$(symlinks):
	rm -rf ~/.$@
	ln -s ${PWD}/$@ ~/.$@

.PHONY: $(symlinks)
