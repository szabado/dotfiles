#!/usr/bin/env bash

source ${DF_PATH}/bash/helpers.sh

link=${HOME}/.gitignore_global
target_file=${FILEPATH}/gitignore_global

lnx "${FILEPATH}/gitignore_global" "${HOME}/.gitignore_global" "Global gitignore"

git config --global user.name "Felix Jancso-Szabo"
git config --global url.git@github.com:.insteadOf https://github.com
git config --global core.exludesfile ~/.gitignore_global
git config --global push.default simple
git config --global core.editor $(which vim)

success "Git config succeeded"
