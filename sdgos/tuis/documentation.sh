#!/bin/bash


CONFIG=/home/$(whoami)/.config/sdgos/tuis/documentation.list

SELECTED=$(cat $CONFIG | cut -d '|' -f 1 | fzf --layout=reverse)

URL=$(cat $CONFIG | grep -e "$SELECTED" | cut -d '|' -f 2)

echo "the command is $URL"

eval $URL
