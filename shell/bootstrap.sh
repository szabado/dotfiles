#!/usr/bin/env bash

source helpers

set -e

running "symlinking oh-my-zsh theme"; echo "";

dst="${HOME}/.oh-my-zsh/custom/themes"
mkdir -p ${dst}

user "Manually run sudo ln -s ~/.dotfiles/shell/my-theme.zsh-theme /usr/share/oh-my-zsh/custom/themes/szabado.zsh-theme"
if ! prompt "did it run successfully?" ; then
	fail "install failed"
fi

ok
