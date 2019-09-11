#!/usr/bin/env bash

source ~/.dotfiles/helpers

shopt -s promptvars

# function parse_git_branch {
#   PS_BRANCH=''
#   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#   PS_BRANCH="(${BLUE}${ref#refs/heads/}${NC})"
#   [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && PS_BRANCH="${PS_BRANCH} ${RED}(dirty)${NC}"
# }
# PROMPT_COMMAND=parse_git_branch
PS_INFO="${GREEN}\u${NC} at ${YELLOW}\h${NC} in ${PURPLE}[\w]${NC}"
# PS_GIT="\${PS_BRANCH}"

# PS1="${PS_INFO} ${PS_GIT}${NC}\n"
PS1="${PS_INFO}${NC}\n"
PS1+='\[\033[01;$((31+!$?*4))m\]'
PS1+="λ ${NC}"

export PS1="${PS1}"
