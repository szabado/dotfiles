#!/usr/bin/env bash

source ${HOME}/.dotfiles/bash/colours.sh

dst="${HOME}/.oh-my-zsh/custom/themes"
mkdir -p ${dst}

if [[ -L "${dst}/szabado.zsh-theme" ]]; then
	unsure "Custom oh-my-zsh theme already linked?"
#	echo -e "${BLUE}?${NC} - Custom zsh theme already linked?"
else
	ln -s ~/.dotfiles/oh-my-zsh/szabado.zsh-theme ~/.oh-my-zsh/custom/themes/szabado.zsh-theme && success "Custom oh-my-zsh theme installed!" #echo -e "${GREEN}✓${NC} - Custom zsh theme installed!"
fi
