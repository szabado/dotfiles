#!/usr/bin/env bash

source helpers

set -e

DOTFILES_HOME="$(pwd)"

vim_configs="${DOTFILES_HOME}/vim"
dst="${HOME}/.vim"

mkdir -p ${dst}

lnx "${vim_configs}/groovy.vim" "${dst}/groovy.vim"
lnx "${vim_configs}/filetype.vim" "${dst}/filetype.vim"
lnx "${vim_configs}/scripts.vim" "${dst}/scripts.vim"

running "Installing nerdtree plugin"
[[ ! -d ~/.vim/pack/vendor/start/nerdtree ]] && git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/vendor/start/nerdtree -q
pushd ~/.vim/pack/vendor/start/nerdtree >/dev/null
git pull -q
popd > /dev/null
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
ok

running "Installing kotlin plugin"
git clone https://github.com/udalov/kotlin-vim.git ~/.vim/pack/plugins/start/kotlin-vim -q
pushd ~/.vim/pack/plugins/start/kotlin-vim >/dev/null
git pull -q
popd > /dev/null
ok
