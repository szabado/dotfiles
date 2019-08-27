#!/usr/bin/env bash

source helpers

set -e

running "symlinking oh-my-zsh theme"
dst="${HOME}/.oh-my-zsh/custom/themes"
info "bla"
mkdir -p ${dst}
info "bla"
lnx "$(pwd)/zsh/my-theme.zsh-theme" "${dst}/szabado.zsh-theme"
ok
