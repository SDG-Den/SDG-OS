#!/bin/bash

state=$(cat ~/.config/SDGupdate.state)

if [ "$state" == "on" ]; then
    cd /home/$(whoami)/SDG-OS
    git pull
    mmsg -d reload-config
fi
