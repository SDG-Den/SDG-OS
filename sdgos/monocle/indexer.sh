#!/bin/bash

MONITOR=HDMI-A-1

# get all clients on that monitor: mmsg get all-clients | jq '.clients[] | select( .monitor == "HDMI-A-1") | .id' -r

ACTIVEMON=$(mmsg get all-monitors | jq '.monitors[] | select(.active == true) | .name' -r)
#echo "activemon is $ACTIVEMON"
ACTIVETAG=$(mmsg get tags $MONITOR | jq '.tags[] | select(.is_active == true) | .index' -r)
#echo "activetag is $ACTIVETAG"
ACTIVEWINDOWS=$(mmsg get all-clients | jq -r --arg ACTIVETAG "$ACTIVETAG" --arg ACTIVEMON "$MONITOR" '.clients[] | select(.tags[] == ($ACTIVETAG | tonumber) and .monitor == $ACTIVEMON) | .id')
#echo "active windows are:"
#echo "----------------------------------------"
#echo "$ACTIVEWINDOWS"
#echo "----------------------------------------"
INDEX=0
echo "" > ~/.config/monocle.state

while read LINE; do
    ID=$LINE
    TITLE=$(mmsg get all-clients | jq -r --arg ID "$LINE" '.clients[] | select(.id == ($ID | tonumber)) | .title' ) 
    INDEX=$((INDEX+1))
    echo "index:$INDEX \ $TITLE \ $ID" >> ~/.config/monocle.state

done <<< "$ACTIVEWINDOWS"

echo "(running)"