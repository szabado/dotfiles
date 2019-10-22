alias ll="ls -al"
alias la="ls -a"
alias egrep="egrep --color=auto"

alias open="xdg-open"

if [[ "${OSTYPE}" == "linux-gnu" ]]; then
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
fi

alias reload!="source ~/.bashrc"

alias gits="git status"
alias gitd="git diff"
alias gitl="git log"
alias gitb="git branch"

pacman-remove-unused() {
	sudo pacman -Rns $(sudo pacman -Qtdq)
}

alias wdiff="wdiff -n -w $'\033[30;41m' -x $'\033[0m' -y $'\033[30;42m' -z $'\033[0m'"
