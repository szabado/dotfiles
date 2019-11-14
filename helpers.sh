#!/usr/bin/env bash
#
# A bunch of utility functions and variables

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
YELLOW='\033[0;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[00m'

fmt() {
	if [[ -n "${1}" ]]; then
		echo -en " ${1}"
	fi
	echo
}

running() {
	echo -en " ${BLUE}┌[º.º]┐ ⇒ ${NC} ${1}..."
}

ok() {
	echo -e "${GREEN}[ok]${NC}"
}

warn () {
	echo -en "${YELLOW}[warn]${NC}"
	fmt "${1}"
}

fail() {
	echo -en "${RED}[fail]${NC}"
	fmt "${1}"
	exit 1
}

info() {
	echo -e "${LIGHT_GRAY}${1}${NC}"
}

module() {
	echo -e " ${LIGHT_GREEN}┌[º.º]┐${NC} ${1}"
}

finished() {
	echo -e " ${LIGHT_GREEN}┌[º.º]┐ All done! No more bare bones for you.${NC}"
}

user() {
	userNoNewline "${1}"
	echo
}

userNoNewline() {
	echo -en "${1}"
}

# From: http://wiki.bash-hackers.org/snipplets/print_horizontal_line
divider() {
	printf '%*s' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

backup() {
	backupDir="${HOME}/.dotfiles/.backups"
	mkdir -p "${backupDir}"

	if [[ $# -ne 1 ]]; then
		fail "Must specify a file to back up"
		return 1
	elif [[ "${1}" != /* ]]; then
		fail "Must specify an absolute path for the file to back up"
		return 1
	fi

	mkdir -p "${backupDir}$(dirname ${1})"
	if [[ -w "${1}" ]]; then
		mv "${1}" "${backupDir}${1}"
	else
		sudo mv "${1}" "${backupDir}${1}"
	fi
}

lnx() {
	target_file=${1}
	link=${2}
	name=$(basename "${link}")

	if [[ -e ${link} ]]; then
		backup "${link}"
	fi

	ln -s ${target_file} ${link}
}

prompt() {
	user "${1}"
	user "[y]es, [n]o"
	userNoNewline "> "
	read -n 1 action
	echo
	case "${action}" in
		[Yy]* )
			return 0;;
		[Nn]* )
			return 1;;
		* )
			return 1;;
	esac
}

err_report() {
	echo "Error on line $1"
}

function clone_or_pull() {
	if [[ $# -ne 3 ]]; then
		fail "cloneOrPull has the incorrect number of arguments"
		return 1
	fi

	name="${1}"
	repo="${2}"
	install_dir="${3}"

	if [[ ! -d "${install_dir}" ]]; then
		running "Installing ${name}"
		git clone "${repo}" "${install_dir}" -q
	else
		running "Updating ${name}"
		pushd "${install_dir}" >/dev/null
		git pull -q
		popd > /dev/null
	fi
	ok
}
