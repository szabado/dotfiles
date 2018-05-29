#!/usr/bin/env bash

source ${DF_PATH}/bash/helpers.sh
dst="${HOME}/.vim"
mkdir -p ${dst}

lnx "${FILEPATH}/groovy.vim" "${dst}/groovy.vim" "Vim Groovy syntax file"
lnx "${FILEPATH}/vimrc" "${HOME}/.vimrc" ".vimrc file"
