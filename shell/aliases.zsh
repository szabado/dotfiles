alias ll="ls -al"
alias la="ls -a"
alias egrep="egrep --color=auto"

alias rg="rg -iL"
alias rgs="rg -sL"
alias rga="rg -iL --hidden"

rgq() {
	rg -L --hidden "${1}" 2>&1 | grep -v "Permission denied" | grep -v "File system loop found" | egrep -v '\(os error \d+\)'
}

alias open="xdg-open"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# alias my-packages="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"

alias notify-done="notify-send 'Done' 'Long-running command has finished'"

alias reload!="source ~/.zshrc"

alias history=omz_history

# alias ubuntu-packages="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"

alias notify-done="notify-send 'Done' 'Long-running command has finished'"

alias gits="git status"
alias gitd="git diff"
alias gitl="git log"
alias gitb="git branch"
