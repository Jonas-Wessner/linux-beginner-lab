#!/bin/bash

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m" # No Color

# Constant strings:
WARN="${RED}Error:${NC}"

ERR=""
SUCC="${GREEN}+++ Congratulations, You have finished part 1 and 2 of this exercise! +++${NC}\n"

FILE="date.txt"
if ! [[ -f "$FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${FILE}' does not exist\n"
else
    if ! [[ $(egrep "$(date "+%a %b")" "${FILE}") ]]; then
        ERR="${ERR}${WARN} Content of the file ${FILE} is not correct\n"
    fi
fi

FILE="$(date +%y_%m_%d_%H.log)"
if ! [[ -f "$FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${FILE}' does not exist\n"
fi

# Emit result
if [ -z "$ERR" ]; then # error variable not set
    printf "$SUCC"
else
    printf "$ERR"
fi
