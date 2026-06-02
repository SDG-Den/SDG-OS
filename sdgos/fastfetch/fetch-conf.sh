#!/bin/bash

bash -c ~/.config/sdgos/fastfetch/update-files.sh

SRC_DIR="$HOME/.config/sdgos/fastfetch/gen"
CONF_DIR="$HOME/.config/sdgos/fastfetch/conf"

SELECTEDLOGO=$(ls -1 $SRC_DIR | fzf --layout=reverse --preview-window=right:70% --prompt='Select a logo: ' --preview-label='Preview:' --preview='bat ~/.config/sdgos/fastfetch/gen/{}')

SELECTEDCONF=$(ls -1 $CONF_DIR | fzf --layout=reverse --preview-window=down:70%,nowrap --color='pointer:green,marker:green' --prompt='Select a config style: ' --preview-label='Preview:' --preview='bash -c "fastfetch --disable-linewrap 1 -l none -c ~/.config/sdgos/fastfetch/conf/{}"')

echo "$SELECTEDLOGO:$SELECTEDCONF" > ~/.config/fetch.state