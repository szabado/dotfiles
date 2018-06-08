#!/usr/bin/env bash

source install/helpers

DOTFILES_ROOT="$(pwd)"

lnx "${DOTFILES_ROOT}/git/gitignore_global" "${HOME}/.gitignore_global"

git config --global user.name "Felix Jancso-Szabo"
if [[ -z "$(git config --get --global user.email)" ]]; then
	user 'What is your github email?'
	read -e git_email
	git config --global user.email "${git_email}"
fi
# git config --global url.git@github.com:.insteadOf https://github.com
git config --global core.exludesfile ~/.gitignore_global
git config --global push.default simple
git config --global core.editor $(which vim)

success "git config complete"
