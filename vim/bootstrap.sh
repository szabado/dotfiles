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

plugins_base_dir="${HOME}/.vim/pack/plugins"
if prompt "Delete all existing Vim plugins"; then
	rm -rf "${plugins_base_dir}"
fi

autoload_plugin_dir="${plugins_base_dir}/start"
clone_or_pull "NERDTree plugin" "https://github.com/scrooloose/nerdtree.git" "${autoload_plugin_dir}/nerdtree"
clone_or_pull "tmux.conf plugin" "https://github.com/tmux-plugins/vim-tmux.git" "${autoload_plugin_dir}/tmux-conf-syntax"
clone_or_pull "Vim-Tmux Navigator plugin" "https://github.com/christoomey/vim-tmux-navigator.git" "${autoload_plugin_dir}/vim-tmux-navigator"
clone_or_pull "Kotlin plugin" "https://github.com/udalov/kotlin-vim.git" "${autoload_plugin_dir}/kotlin"
