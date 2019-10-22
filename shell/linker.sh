#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "${DIR}/env.sh"
source "${DIR}/aliases.sh"
source "${DIR}/bash-theme.sh"
export PATH="${PATH}:${DIR}/../bin"
