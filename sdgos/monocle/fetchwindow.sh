#!/bin/bash


INDEX="$1"

WINDOWTITLE=$(cat ~/.config/monocle.state | grep -e "index:$INDEX" | cut -d'\' -f2)

echo "$WINDOWTITLE"
