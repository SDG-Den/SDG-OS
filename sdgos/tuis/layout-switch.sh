#!/bin/bash

#mmsg dispatch togglefloating


SELECTED=$(cat ~/.config/sdgos/tuis/layouts.list | cut -d '|' -f 1 | fzf --layout=reverse)

CMD=$(cat ~/.config/sdgos/tuis/layouts.list | grep -e "$SELECTED" | cut -d '|' -f 2)

eval $CMD

if [[ "$SELECTED" == "Monocle " ]] || [[ "$SELECTED" == "Deck - horizontal " ]] || [[ "$SELECTED" == "Deck - vertical " ]]; then
    pkill -9 waybar
    mmsg dispatch spawn_shell,'waybar -c ~/.config/sdgos/monocle/config -s ~/.config/sdgos/monocle/style.css'
else
    pkill -9 waybar
fi