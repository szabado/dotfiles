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

ROBOT='[+]'

running() {
	echo -en "     ⇒ ${1}..."
}

ok() {
	echo -e "${GREEN}[ok]${NC}"
}

log() {
	echo -e "${LIGHT_GRAY}${1}${NC}"
}

header() {
	echo -e " ${LIGHT_GREEN}${ROBOT}${NC} ${1}"
}

user() {
	userNoNewline "${1}"
	echo
}

# Everything is tied to this to make theming changes easy if wanted
userNoNewline() {
	echo -en "${1}"
}

archive() {
	if [[ $# -ne 1 || "${1}" != /* ]]; then
		# The absolute path of a file must be specified
		exit 1
	fi

	backupDir="${HOME}/.dotfile_backups"
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

	if [[ -e ${link} ]]; then
		archive "${link}"
	fi

	ln -s ${target_file} ${link}
}

prompt() {
	user "${1} (Y/n)"
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
		# "cloneOrPull has the incorrect number of arguments"
		exit 1
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
