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
	echo -e "${GREEN}✓${NC} $1"
}

unsure() {
	echo -e "${BLUE}?${NC} $1"
}

failure() {
	echo -e "${RED}✖${NC} $1"
}

# From: http://wiki.bash-hackers.org/snipplets/print_horizontal_line
divider() {
	printf '%*s' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

lnx() {
        target_file=$1
        link=$2
        name=$3

        if [[ -L ${link} ]]; then
                if [[ "$(readlink ${link})" = "${target_file}" ]]; then
                        success "${name} already linked!"
                else
                        failure "${name} already linked to another location"
                fi
        elif [[ -f ${link} ]]; then
                failure "${name}'s location aleady occupied by a regular file"
        else
                ln -s ${target_file} ${link} && success "${name} linked successfully!"
        fi
}