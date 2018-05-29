#!/usr/bin/env bash

source ${DF_PATH}/bash/helpers.sh
dst="${HOME}/.vim"
mkdir -p ${dst}

lnx "${FILEPATH}/groovy.vim" "${dst}/groovy.vim" "groovy.vim"
lnx "${FILEPATH}/vimrc" "${HOME}/.vimrc" ".vimrc"
lnx "${FILEPATH}/filetype.vim" "${HOME}/.vim/filetype.vim" "filetype.vim"
lnx "${FILEPATH}/scripts.vim" "${HOME}/.vim/scripts.vim" "scripts.vim"

