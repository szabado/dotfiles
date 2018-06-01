#!/usr/bin/env bash

source bash/helpers.sh

dst="${HOME}/.oh-my-zsh/custom/themes"
mkdir -p ${dst}

lnx "${FILEPATH}/my-theme.zsh-theme" "${dst}/szabado.zsh-theme" "Custom oh-my-zsh-theme"

