#!/usr/bin/env bash

source install/helpers

DOTFILES_ROOT="$(pwd)"

dst="${HOME}/.oh-my-zsh/custom/themes"
mkdir -p ${dst}

lnx "${DOTFILES_ROOT}/zsh/my-theme.zsh-theme" "${dst}/szabado.zsh-theme"

