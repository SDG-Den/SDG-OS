#!/bin/bash


INDEX="$1"

while [ -e ~/.config/monocle.lock ]; do
    sleep 0.01
done

WINDOWTITLE=$(cat ~/.config/monocle.state | grep -e "index:$INDEX" | cut -d'\' -f2)




echo "$WINDOWTITLE"
