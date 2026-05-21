#!/bin/bash
while $true; do
    cat ~/.config/sdgos/help/$1.list | fzf -e --layout=reverse
done