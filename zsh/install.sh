#!/usr/bin/env bash

source ${DF_PATH}/bash/colours.sh

dst="${HOME}/.oh-my-zsh/custom/themes"
mkdir -p ${dst}

link="${dst}/szabado.zsh-theme"
target_file="${FILEPATH}/my-theme.zsh-theme"

if [[ -L ${link} ]]; then
	if [[ "$(readlink ${link})" = "${target_file}" ]]; then
		success "Custom oh-my-zsh theme already installed!"
	else
		failure "Custom oh-my-zsh theme already linked to another location"
	fi
elif [[ -f ${link} ]]; then
	failure "Regular file already exists in custom oh-my-zsh theme location"
else
	ln -s ${target_file} ${link} && success "Custom oh-my-zsh theme installed!"
fi
