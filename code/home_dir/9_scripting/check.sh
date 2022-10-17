#!/bin/bash

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m" # No Color

# Constant strings:
WARN="${RED}Error:${NC}"

ERR=""
SUCC="${GREEN}+++ Congratulations, You have finished this exercise! +++${NC}\n"

NEW_FILE="my_file.txt"
if ! [[ -f "$NEW_FILE" ]]; then
    ERR="${ERR}${WARN} File with the name '${NEW_FILE}' does not exist\n"
fi

FILE_TO_DELETE="useless.json"
if [[ -f "$FILE_TO_DELETE" ]]; then
    ERR="${ERR}${WARN} File with the name '${FILE_TO_DELETE}' does still exist\n"
fi

NEW_DIR="new_files"
if ! [[ -d "$NEW_DIR" ]]; then
    ERR="${ERR}${WARN} Directory with the name '${NEW_DIR}' does not exist\n"
else
    EXPECTED="best_recipe.txt.new, morning_routine.txt.new, shopping_list.txt.new"
    if ! [[ $(ls -m ${NEW_DIR}/) = "$EXPECTED" ]]; then
        ERR="${ERR}${WARN} The directory 'new_files' does not exactly contain all files with the suffix '.new'\n"
    fi
fi

SUFFIX_TO_DELETE=".old"
if [[ $(ls -A | grep "$SUFFIX_TO_DELETE") ]]; then
    ERR="${ERR}${WARN} You have not deleted all files with the suffix '${SUFFIX_TO_DELETE}' yet.\n"
fi

BEFORE="weird_name.txt"
AFTER="good_name.txt"
if [[ -f "$BEFORE" || ! -f "$AFTER" ]]; then
    ERR="${ERR}${WARN} You have not renamed the file '${BEFORE}' to '${AFTER}' yet.\n"
fi

TRASH="trash"
if [[ ! -d "$TRASH" || -n $(ls -A "$TRASH") ]]; then
    ERR="${ERR}${WARN} You have not cleared the directory '${TRASH}' yet.\n"
fi


# Emit result
if [ -z "$ERR" ]; then # error variable not set
    printf "$SUCC"
else
    printf "$ERR"
fi

