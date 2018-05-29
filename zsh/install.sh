#!/usr/bin/env bash

source ${DF_PATH}/bash/colours.sh

dst="${HOME}/.oh-my-zsh/custom/themes"
mkdir -p ${dst}

dst_file="${dst}/szabado.zsh-theme"
target_file="${FILEPATH}/my-theme.zsh-theme"

if [[ -L ${dst_file} ]]; then
	if [[ "$(readlink ${dst_file})" = "${target_file}" ]]; then
		success "Custom oh-my-zsh theme already installed!"
	else
		failure "Custom oh-my-zsh theme already linked to another location"
	fi
elif [[ -f ${dst_file} ]]; then
	failure "Regular file already exists in custom oh-my-zsh theme location"
else
	ln -s ${FILEPATH}/my-theme.zsh-theme ${dst_file} && success "Custom oh-my-zsh theme installed!"
fi
