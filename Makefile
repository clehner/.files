links=gitignore gvimrc vim vimrc zsh zshrc


all: build

build: update-submodules

install: build $(links)


update-submodules:
	git submodule update --init

$(links):
	ln -sfh $$(pwd)/$@ ~/.$@

.PHONY: $(links)
