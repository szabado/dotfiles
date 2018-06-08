#!/usr/bin/env bash
#
# Configure git

source install/helpers

set -e

DOTFILES_ROOT="$(pwd)"

lnx "${DOTFILES_ROOT}/git/gitignore_global" "${HOME}/.gitignore_global"

if [[ -z "$(git config --get --global user.name)" ]]; then
	user 'What is your github nom de plume?'
	read -e git_name
	git config --global user.name "${git_name}"
fi
if [[ -z "$(git config --get --global user.email)" ]]; then
	user 'What is your github email?'
	read -e git_email
	git config --global user.email "${git_email}"
fi
if prompt "Disable https for git in favour of ssh?"; then
	git config --global url.git@github.com:.insteadOf https://github.com
fi
git config --global core.exludesfile ~/.gitignore_global
git config --global push.default simple
git config --global core.editor $(which vim)

success "git config complete"

