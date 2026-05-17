#!/bin/bash

if [ ! -f ~/.config/firstrun.state ]; then
    dms ipc call settings open
    dms ipc call keybinds openWithPath mangowc ~/.config/mango/binds.conf
    touch ~/.config/firstrun.state
fi
exit 0
