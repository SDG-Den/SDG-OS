#!/bin/bash

SELECTED="$1"


WP_DIR=~/.config/sdgos/wallpapers

WP_GROUPS=$(ls "$WP_DIR" -l --group-directories-first | grep -e '^d.*' | awk '{print $9}' )


if [[ $SELECTED == "" ]]; then

    SELECTED=$(echo "$WP_GROUPS" | fzf --layout=reverse)
fi
echo "user selected $SELECTED"

dms ipc call wallpaper set "$WP_DIR/$SELECTED/$(ls -1 "$WP_DIR/$SELECTED" | head -n 1)"
sleep 0.5
dms ipc call wallpaper next
dms ipc call wallpaper prev
