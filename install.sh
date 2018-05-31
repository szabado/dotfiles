#!/usr/bin/env bash

DF_PATH=${HOME}/.dotfiles
cd ${DF_PATH}

source bash/helpers.sh

FILES=$(find `pwd` -name "install.sh")
EXCLUDE_FILES=("${DF_PATH}/install.sh")
FILES=( ${FILES[@]/$EXCLUDE_FILES} )

# todo: add a global force option that overwrites existing things
for i in "${FILES[@]}"; do
	divider
	echo "Running: $i"
	divider
	FILEPATH=$(echo $i | xargs dirname) DF_PATH=${DF_PATH} $i 
done

