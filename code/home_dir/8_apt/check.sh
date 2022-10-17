#!/bin/bash

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m" # No Color

# Constant strings:
WARN="${RED}Error:${NC}"

ERR=""
SUCC="${GREEN}+++ Congratulations, You have finished this exercise! +++${NC}\n"

ZIP_FILE="big_data.csv"
if [[ ! -f "$ZIP_FILE" ]]; then
    ERR="${ERR}${WARN} You have not unzipped the file correctly yet.\n"
else
    CHECKSUM=($(md5sum "${ZIP_FILE}"))
    if [[ ! ${CHECKSUM[0]} = "80c7f96b06a207fe04980767c8fa3995" ]]; then
        ERR="${ERR}${WARN} You have not unzipped the file correctly yet.\n"
    else
        if [[ -n $(apt list --installed 2>/dev/null | grep unzip) ]]; then
            ERR="${ERR}${WARN} You have not properly unistalled the program 'unzip' using apt yet.\n"
        fi
    fi
fi

# Emit result
if [ -z "$ERR" ]; then # error variable not set
    printf "$SUCC"
else
    printf "$ERR"
fi
