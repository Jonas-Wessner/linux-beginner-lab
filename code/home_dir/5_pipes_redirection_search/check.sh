#!/bin/bash

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m" # No Color

# Constant strings:
WARN="${RED}Error:${NC}"

ERR=""
SUCC="${GREEN}+++ Congratulations, You have finished this exercise! +++${NC}\n"

NEW_FILE="best_recipe.txt.new"
if ! [[ -f "$NEW_FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${NEW_FILE}' does not exist\n"
fi

NEW_FILE="morning_routine.txt.new"
if ! [[ -f "$NEW_FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${NEW_FILE}' does not exist\n"
else
    SOL_FILE='.concat.solution'
    if ! [[ $(cat "${NEW_FILE}") = $(cat "${SOL_FILE}") ]]; then
        ERR="${ERR}${WARN} Content of the file ${NEW_FILE} is not correct\n"
    fi
fi

SEARCH_FILE="search_results.txt"
if ! [[ -f "$SEARCH_FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${SEARCH_FILE}' does not exist\n"
else
    if ! [[ $(cat "${SEARCH_FILE}") = $(grep ",Q" < titanic_train.csv) ]]; then
        ERR="${ERR}${WARN} Content of the file ${SEARCH_FILE} is not correct\n"
    fi
fi

COUNT_FILE='count.txt'
if ! [[ -f "$COUNT_FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${COUNT_FILE}' does not exist\n"
else
    if ! [[ $(cat "${COUNT_FILE}") = $(egrep ",S" titanic_train.csv | wc -l) ]]; then
        ERR="${ERR}${WARN} Content of the file ${COUNT_FILE} is not correct\n"
    fi
fi


# Emit result
if [ -z "$ERR" ]; then # error variable not set
    printf "$SUCC"
else
    printf "$ERR"
fi

