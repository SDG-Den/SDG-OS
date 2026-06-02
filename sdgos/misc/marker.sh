#!/bin/bash

ACTIVEMON=$(mmsg get all-monitors | jq '.monitors[] | select(.active == true) | .name' -r)
ACTIVETAG=$(mmsg get tags DP-1 | jq '.tags[] | select(.is_active == true) | .index' -r)
ACTIVEWINDOWS=$(mmsg get all-clients | jq -r --arg ACTIVETAG "$ACTIVETAG" --arg ACTIVEMON "$ACTIVEMON" '.clients[] | select(.tags[] == ($ACTIVETAG | tonumber) and .monitor == $ACTIVEMON) | .id')

echo "active monitor is $ACTIVEMON"
echo "active tag is $ACTIVETAG"
echo "active windows are:"
echo "$ACTIVEWINDOWS"

echo "$ACTIVEWINDOWS" > ~/.config/marker.state
echo "$ACTIVEMON:$ACTIVETAG" > ~/.config/marker.workspace
echo "marker state saved"
notify-send "monitor marked"



