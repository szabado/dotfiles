#!/usr/bin/env bash

source install/helpers

DOTFILES_HOME="$(pwd)"

vim_configs="${DOTFILES_HOME}/vim"
dst="${HOME}/.vim"

mkdir -p ${dst}

lnx "${dst}/groovy.vim" "${vim_configs}/groovy.vim"
lnx "${dst}/filetype.vim" "${vim_configs}/filetype.vim"
lnx "${dst}/scripts.vim" "${vim_configs}/scripts.vim"

