#!/bin/bash

SRC_DIR="$HOME/.config/sdgos/fastfetch/gen"
CONF_DIR="$HOME/.config/sdgos/fastfetch/conf"

LOGO=$(cat ~/.config/fetch.state | cut -d: -f1)
CONF=$(cat ~/.config/fetch.state | cut -d: -f2)

#echo "logo is $SRC_DIR/$LOGO, conf is $CONF_DIR/$CONF"

if [ "$LOGO" == "none" ]; then
    fastfetch -l none -c $CONF_DIR/$CONF
else
    fastfetch  -l $SRC_DIR/$LOGO -c $CONF_DIR/$CONF
fi
