#!/usr/bin/env bash

source ${DF_PATH}/bash/colours.sh

link=${HOME}/.gitignore_global
target_file=${FILEPATH}/gitignore_global

if [[ -L ${link} ]]; then
        if [[ "$(readlink ${link})" = "${target_file}" ]]; then
                success "Global gitignore already configured!"
        else
                failure "Global gitignore already linked elsewhere..."
        fi
elif [[ -f ${link} ]]; then
        failure "Regular file already exists in global gitignore location"
else
        ln -s ${FILEPATH}/my-theme.zsh-theme ${link} && success "Custom oh-my-zsh theme installed!"
fi

git config --global user.name "Felix Jancso-Szabo"
git config --global url.git@github.com:.insteadOf https://github.com
git config --global core.exludesfile ~/.gitignore_global
git config --global push.default simple

success "Git config succeeded"
