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

function install_plugin() {
	if [[ $# -ne 3 ]]; then
		fail "install_plugin has the incorrect number of arguments"
		return 1
	fi

	name="${1}"
	repo="${2}"
	install_dir="${3}"

	if [[ ! -d "${install_dir}" ]]; then
		running "Installing ${name} plugin"
		git clone "${repo}" "${install_dir}" -q
	else
		running "Updating ${name} plugin"
		pushd "${install_dir}" >/dev/null
		git pull -q
		popd > /dev/null
	fi
	ok
}

plugins_base_dir="${HOME}/.vim/pack/plugins"
if prompt "Delete all existing Vim plugins"; then
	rm -rf "${plugins_base_dir}"
fi

autoload_plugin_dir="${plugins_base_dir}/start"
install_plugin "NERDTree" "https://github.com/scrooloose/nerdtree.git" "${autoload_plugin_dir}/nerdtree"
install_plugin "tmux.conf" "git://github.com/tmux-plugins/vim-tmux.git" "${autoload_plugin_dir}/tmux-conf-syntax"
install_plugin "Vim-Tmux Navigator" "git@github.com:christoomey/vim-tmux-navigator.git" "${autoload_plugin_dir}/vim-tmux-navigator"

