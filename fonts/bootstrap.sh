#!/usr/bin/env bash
#
# Install fonts

set -e

source install/helpers

fontDir="${HOME}/.fonts"
if [[ "$(uname)" = "Darwin" ]]; then
	fontDir="${HOME}/Library/Fonts"
fi

running "Installing powerline-patched monofur"
if [[ ! -e "${fontDir}/monofur_powerline.ttf" ]]; then
	wget -q https://github.com/rsrsl/ttf-monofur-powerline/archive/master.zip -P "${fontDir}"
	unzip -qd "${fontDir}" "${fontDir}"/master.zip
	rm    "${fontDir}"/master.zip
	mv    "${fontDir}"/ttf-monofur-powerline-master/*.ttf "${fontDir}"
	rm -r "${fontDir}"/ttf-monofur-powerline-master
fi
ok

if [[ "$(uname)" != "Darwin" ]]; then
	running "Rebuilding font cache"
	fc-cache -f -v > /dev/null 2>&1; ok
fi

