#!/bin/bash


INDEX="$1"

ACTIVEMON=$(mmsg get all-monitors | jq '.monitors[] | select(.active == true) | .name' -r)
echo "activemon is $ACTIVEMON"
ACTIVETAG=$(mmsg get tags $ACTIVEMON | jq '.tags[] | select(.is_active == true) | .index' -r)
echo "activetag is $ACTIVETAG"

WINDOWID=$(cat ~/.config/monocle.state | grep -e "index:$INDEX" | cut -d'\' -f3)
WINDOWtitle=$(cat ~/.config/monocle.state | grep -e "index:$INDEX" | cut -d'\' -f2)
echo "moving window $WINDOWID"

mmsg dispatch zoom client,$WINDOWID
