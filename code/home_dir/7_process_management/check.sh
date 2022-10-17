#!/bin/bash

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m" # No Color

# Constant strings:
WARN="${RED}Error:${NC}"

ERR=""
SUCC="${GREEN}+++ Congratulations, You have finished part 1-6 of this exercise! +++${NC}\n"

FILE="running.txt"
if ! [[ -f "$FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${FILE}' does not exist\n"
else
    if [[ $(diff "${FILE}" .running.solution) ]]; then
        ERR="${ERR}${WARN} Content of the file ${FILE} is not correct\n"
    fi
fi

FILE="stopped.txt"
if ! [[ -f "$FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${FILE}' does not exist\n"
else
    if [[ $(diff "${FILE}" .stopped.solution) ]]; then
        ERR="${ERR}${WARN} Content of the file ${FILE} is not correct\n"
    fi
fi

FILE="finished.txt"
if ! [[ -f "$FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${FILE}' does not exist, which means that the command from the first task has not completed yet.\n"
fi


# Emit result
if [ -z "$ERR" ]; then # error variable not set
    printf "$SUCC"
else
    printf "$ERR"
fi

