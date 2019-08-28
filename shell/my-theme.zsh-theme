# szabado theme.  Homebrewed, two lined and simple
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# May 2018 - Felix Jancso-Szabo

prompt_segment() {
  [[ -n $1 ]] && echo -n $1
}

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
	  prompt_segment "%{$fg[green]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} "
  fi
}

prompt_dir() {
  prompt_segment "in %{$fg[magenta]%}[%~]%{$reset_color%} "
}

prompt_git() {
  prompt_segment '$(git_prompt_info)'  
}

build_prompt() {

  prompt_context
  prompt_dir
  prompt_git
}

build_rprompt() {
  prompt_segment "%{%(0?.$fg[green].$fg[red])%}[%?]%{$reset_color%}"
}

RPROMPT="$(build_rprompt)"

PROMPT="$(build_prompt)
λ "

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} (dirty)"
ZSH_THEME_GIT_PROMPT_CLEAN=""
