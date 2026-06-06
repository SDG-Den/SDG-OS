#!/bin/bash

echo "off" > ~/.config/monocledaemon.state

# constant command: mmsg watch all-monitors | jq -r '.monitors[] | select(.tags[] | select(.is_active == true) | .layout | test("M|K|VK")) | .name'