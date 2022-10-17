#!/bin/bash
DIR="${1}"

if [[ "${DIR}" = "all" ]]; then
    # delete all exercise directories
    rm -rf ./*_*
    cp -r backup/* .
else
    if [[ "${DIR}" = "" ]]; then
            echo "You must specify a directory name or 'all'"
    else
        rm -rf "${DIR}"
        cp -r "backup/${DIR}" .
    fi
fi

