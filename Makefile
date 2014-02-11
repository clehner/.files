symlinks = \
	gitconfig \
	gitignore \
	screenrc \
	tmux.conf \
	vim \
	gvimrc \
	vimrc \
	jshintrc \
	Xresources \
	i3 \
	config/redshift.conf \
	ssh/authorized_keys \
	ssh/config

all: update-submodules

install: all $(symlinks)

update-submodules:
	git submodule init
	git submodule update --depth 1

$(symlinks):
	rm -rf ~/.$@
	ln -s ${PWD}/$@ ~/.$@

.PHONY: $(symlinks)
