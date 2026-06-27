#!/bin/bash

#mmsg dispatch togglefloating


SELECTED=$(cat ~/.config/sdgos/tuis/layouts.list | cut -d '|' -f 1 | fzf --layout=reverse)

CMD=$(cat ~/.config/sdgos/tuis/layouts.list | grep -e "$SELECTED" | cut -d '|' -f 2)

eval $CMD
