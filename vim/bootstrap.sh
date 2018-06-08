#!/usr/bin/env bash

source install/helpers

DOTFILES_HOME="$(pwd)"

vim_configs="${DOTFILES_HOME}/vim"
dst="${HOME}/.vim"

mkdir -p ${dst}

lnx "${vim_configs}/groovy.vim" "${dst}/groovy.vim"
lnx "${vim_configs}/filetype.vim" "${dst}/filetype.vim"
lnx "${vim_configs}/scripts.vim" "${dst}/scripts.vim"

