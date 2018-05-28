#!/usr/bin/env bash

cd ${HOME}/.dotfiles

source bash/colours.sh

FILES=$(find `pwd` -name "install.sh")
EXCLUDE_FILES=("${HOME}/.dotfiles/install.sh")
FILES=( "${FILES[@]/$EXCLUDE_FILES}" )

for i in "${FILES[@]}"; do
	$i
done
# todo: add a global force option that overwrites existing things

# ${HOME}/.dotfiles/zsh/install.sh

