#!/usr/bin/env bash

source ${DF_PATH}/bash/colours.sh

dst="${HOME}/.vim"
mkdir -p ${dst}

link="${dst}/groovy.vim"
target_file="${FILEPATH}/groovy.vim"

if [[ -L ${link} ]]; then
        if [[ "$(readlink ${link})" = "${target_file}" ]]; then
                success "Groovy vim syntax file already installed!"
        else
                failure "Groovy vim syntax file already linked to another location"
        fi
elif [[ -f ${link} ]]; then
        failure "Regular file already exists in Groovy vim syntax file location"
else
        ln -s ${target_file} ${link} && success "Groovy vim syntax file installed!"
fi
