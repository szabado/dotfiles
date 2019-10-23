#!/usr/bin/env bash

source ~/.dotfiles/helpers

source ~/.dotfiles/shell/gitstatus/gitstatus.prompt.sh

# Colours in the shell prompt need to have backslashed [ and ] characters around them to
# prevent affecting the length of the prompt
GREEN="\[${GREEN}\]"
YELLOW="\[${YELLOW}\]"
PURPLE="\[${PURPLE}\]"
NC="\[${NC}\]"

shopt -s promptvars

PS_INFO="${GREEN}\u${NC} at ${YELLOW}\h${NC} in ${PURPLE}[\w]${NC}"

PS1="${PS_INFO}${NC}"
PS1+=' ${GITSTATUS_PROMPT}'
PS1+="\n"
PS1+='\[\033[01;$((31+!$?*4))m\]'
PS1+="λ ${NC}"

PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

export PS1="${PS1}"
