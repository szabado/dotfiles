#!/usr/bin/env bash

source helpers.sh

set -Eeuo pipefail

DOTFILES_HOME="$(pwd)"

vim_configs="${DOTFILES_HOME}/vim"
dst="${HOME}/.vim"

mkdir -p ${dst}

lnx "${vim_configs}/groovy.vim" "${dst}/groovy.vim"
lnx "${vim_configs}/filetype.vim" "${dst}/filetype.vim"
lnx "${vim_configs}/scripts.vim" "${dst}/scripts.vim"

install_dir="${HOME}/.vim/pack/vendor/start/nerdtree"
if [[ ! -d "${install_dir}" ]]; then
	running "Installing nerdtree plugin"
	git clone https://github.com/scrooloose/nerdtree.git "${install_dir}" -q
else
	running "Updating nerdtree plugin"
	pushd "${install_dir}" >/dev/null
	git pull -q
	popd > /dev/null
fi
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
ok

install_dir="${HOME}/.vim/pack/plugins/start/kotlin-vim"
if [[ ! -d "${install_dir}" ]]; then
	running "Installing kotlin plugin"
	git clone https://github.com/udalov/kotlin-vim.git "${install_dir}" -q
else
	running "Updating kotlin plugin"
	pushd "${install_dir}" >/dev/null
	git pull -q
	popd > /dev/null
fi
ok

install_dir="${HOME}/.vim/pack/plugins/start/vim-tmux"
if [[ ! -d "${install_dir}" ]]; then
	running "Installing tmux.conf plugin"
	git clone git://github.com/tmux-plugins/vim-tmux.git "${install_dir}" -q
else
	running "Updating tmux.conf plugin"
	pushd "${install_dir}" >/dev/null
	git pull -q
	popd > /dev/null
fi
ok

install_dir="${HOME}/.vim/pack/plugins/start/vim-tmux-navigator"
if [[ ! -d "${install_dir}" ]]; then
	running "Installing Vim-Tmux navigator plugin"
	git clone git@github.com:christoomey/vim-tmux-navigator.git "${install_dir}" -q
else
	running "Updating Vim-Tmux navigator plugin"
	pushd "${install_dir}" > /dev/null
	git pull -q
	popd > /dev/null
fi
ok

