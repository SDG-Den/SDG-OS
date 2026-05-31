#!/bin/bash

while $true; do
    CMD=""
    SELECTED=$(ls ~/.config/sdgos/help/topics | fzf --layout=reverse --preview-window 'right:70%:wrap-word' --preview="clear && bat --style=plain -S -f -m '*:Markdown' ~/.config/sdgos/help/topics/{}")
done
