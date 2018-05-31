#!/usr/bin/env bash
#
# A bunch of utility functions and variables

if [[ -z "${HELPERS_IMPORTED}" ]]; then

HELPERS_IMPORTED="true"

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN_ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
DARK_GRAY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

success() {
	echo -e "${GREEN}✓ $1${NC}"
}

unsure() {
	echo -e "${BLUE}? $1${NC}"
}

failure() {
	echo -e "${RED}✖ $1${NC}"
}

warn () {
	echo -e "${YELLOW}⚠ $1${NC}"
}

info() {
	echo -e "${DARK_GRAY}  $1${NC}"
}

user() {
	echo -e "  $1"
}

# From: http://wiki.bash-hackers.org/snipplets/print_horizontal_line
divider() {
	printf '%*s' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}


lnx() {
	target_file=$1
	link=$2

	skip=false

	if [[ -e ${link} || -L ${link} ]]; then
		if [[ "$(readlink ${link})" = "${target_file}" ]]; then
			success "${link} already linked!"
			skip=true
		else

			overwrite=false
			user "File already exists: ${link} ($(basename "${target_file}")), what do you want to do?\n\
			[s]kip, [o]verwrite?"
			read -n 1 action
			case "$action" in
				o )
					overwrite=true;;
				s )
					skip=true;;
				* )
					warn "invalid input. Skipping"; skip=true;;
			esac

			if [[ ${overwrite} = "true" ]]; then
				rm -rf ${link}
				success "deleted old file"
			fi
		fi
	fi

	if [[ ${skip} != 'true' ]]; then
		ln -s ${target_file} ${link} && success "${name} linked successfully!"
	fi
}

# yoinked from Holman's dotfiles
link_file () {
	local src=$1 dst=$2

	local overwrite= backup= skip=
	local action=

	if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
	then

		if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
		then

			local currentSrc="$(readlink $dst)"

			if [ "$currentSrc" == "$src" ]
			then

				skip=true;

			else

				user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
				[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
				read -n 1 action

				case "$action" in
					o )
						overwrite=true;;
					O )
						overwrite_all=true;;
					b )
						backup=true;;
					B )
						backup_all=true;;
					s )
						skip=true;;
					S )
						skip_all=true;;
					* )
						;;
				esac

			fi

		fi

		overwrite=${overwrite:-$overwrite_all}
		backup=${backup:-$backup_all}
		skip=${skip:-$skip_all}

		if [ "$overwrite" == "true" ]
		then
			rm -rf "$dst"
			success "removed $dst"
		fi

		if [ "$backup" == "true" ]
		then
			mv "$dst" "${dst}.backup"
			success "moved $dst to ${dst}.backup"
		fi

		if [ "$skip" == "true" ]
		then
			success "skipped $src"
		fi
	fi

	if [ "$skip" != "true" ]	# "false" or empty
	then
		ln -s "$1" "$2"
		success "linked $1 to $2"
	fi
}

fi
