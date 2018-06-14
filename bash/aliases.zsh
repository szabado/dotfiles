alias ll="ls -al"
alias egrep="egrep --color=always"

alias rg="rg -L"
alias rgS="rg -S"
alias rgs="rg -s"
alias rgi="rg -i"
rgq() {
	rg --hidden "${1}" 2>&1 | grep -v "Permission denied" | grep -v "File system loop found" | egrep -v '\(os error \d+\)'
}

alias treeless="tree | less"

