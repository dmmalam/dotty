init:
	git submodule init
	git submodule update

requires:
	sh requires.sh

update:
	git pull
	git submodule -q foreach git pull -q origin master

install:
	sh install.sh

.PHONY: install
