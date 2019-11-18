#!/usr/bin/env bash

set -Eeuo pipefail

source ./helpers.sh

# TODO: Fix this, it's broken right now
exit 0

info "installing your tools"

goIsInstalled="$(command -v go)"

if [[ -z "${goIsInstalled}" ]]; then
	fail "Go is not installed, install it and re-run this script."
else
	# running "Installing mssh"
	# go install github.com/szabado/mssh >/dev/null 2>&1; ok
	# go install github.com/szabado/zkcli >/dev/null
	# go install github.com/szabado/ds >/dev/null
	rm go.{mod,sum}
fi
