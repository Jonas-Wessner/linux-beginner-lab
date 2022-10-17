#!/bin/bash

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m" # No Color

# Constant strings:
WARN="${RED}Error:${NC}"

ERR=""
SUCC="${GREEN}+++ Congratulations, You have finished this exercise! +++${NC}\n"

NEW_FILE="lets_go_vim.txt"
if ! [[ -f "$NEW_FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${NEW_FILE}' does not exist\n"
else
    EXPECTED='Hello Vim!'
    if ! [[ $(cat "${NEW_FILE}" | grep "$EXPECTED") ]]; then
        ERR="${ERR}${WARN} The content of the file ${NEW_FILE} is not correct.\n"
    fi
fi

FILE='shopping_list.txt'
EXPECTED='- Water
- Butter
- Cookies
- Soap'
if [[ ! $(cat "${FILE}" | grep "-") = $EXPECTED ]]; then
    ERR="${ERR}${WARN} The content of the file ${FILE} is not correct.\n"
fi



# Emit result
if [ -z "$ERR" ]; then # error variable not set
    printf "$SUCC"
else
    printf "$ERR"
fi

