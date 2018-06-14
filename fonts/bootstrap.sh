#!/usr/bin/env bash
#
# Install fonts

set -e

source install/helpers

if [[ "$(uname)" = "Darwin" ]]; then
	ln -s ~/Library/Fonts ~/.fonts
else
	mkdir -p ${HOME}/.fonts
fi

running "Installing powerline-patched monofur"
if [[ ! -e "${HOME}/.fonts/monofur_powerline.ttf" ]]; then
	wget -q https://github.com/rsrsl/ttf-monofur-powerline/archive/master.zip -P ~/.fonts
	unzip -qd ~/.fonts/ ~/.fonts/master.zip
	mv ~/.fonts/ttf-monofur-powerline-master/*.ttf ~/.fonts
	rm -r ~/.fonts/ttf-monofur-powerline-master
	rm ~/.fonts/master.zip
fi
ok

running "Rebuilding font cache"
fc-cache -f -v > /dev/null 2>&1; ok

