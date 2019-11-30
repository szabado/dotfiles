#!/usr/bin/env bash
#
# Configure git

source helpers.sh

set -e

DOTFILES_ROOT="$(pwd)"

if [[ -z "$(git config --get --global user.name)" ]]; then
	user 'What is your git name?'
	userNoNewline '> '
	read -e git_name
	running "Setting git user name"
	git config --global user.name "${git_name}"; ok
fi

if [[ -z "$(git config --get --global user.email)" ]]; then
	user 'What is your git email?'
	userNoNewline '> '
	read -e git_email
	git config --global user.email "${git_email}"; ok
fi

# if prompt "Disable https for git in favour of ssh?"; then
# 	running "Disabling https for git"
# 	git config --global url.git@github.com:.insteadOf https://github.com; ok
# fi

running "Configuring global gitignore"
git config --global core.excludesfile ~/.gitignore_global; ok
running "Configuring git push preferences"
git config --global push.default simple; ok
running "Setting core git editor to vim"
git config --global core.editor $(which vim); ok
running "Disabling the pager on git branch"
git config --global pager.branch false; ok
