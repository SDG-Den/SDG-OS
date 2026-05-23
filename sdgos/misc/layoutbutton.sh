#!/bin/bash


ACTIVEMON=$(mmsg -g -o | grep -e "selmon 1" | awk '{print $1}')

echo $ACTIVEMON

LAYOUT=$(mmsg -g -l | grep -e "$ACTIVEMON" | awk '{print $3}')

echo "$LAYOUT"

case $LAYOUT in
    T)
        echo "Left Master"
        mmsg -d zoom
        ;;
    S)
        echo "Horizontal Scroller"
        mmsg -d switch_proportion_preset
        ;;
    G)
        echo "Horizontal Grid"
        mmsg -d togglegaps
        ;;
    M)
        echo "Monocle"
        ;;
    K)
        echo "Horizontal Deck"
        mmsg -d zoom
        ;;
    CT)
        echo "Center Master"
        mmsg -d zoom
        ;;
    RT)
        echo "Right Master"
        mmsg -d zoom
        ;;
    VS)
        echo "Vertical Scroller"
        mmsg -d switch_proportion_preset
        ;;
    VT)
        echo "Top Master"
        mmsg -d zoom
        ;;
    VG)
        echo "Vertical Grid"
        mmsg -d togglegaps
        ;;
    VK)
        echo "Vertical Deck"
        mmsg -d zoom
        ;;
    DW)
        echo "Dwindle"
        mmsg -d togglemaximizescreen
        ;;
    F)
        echo "Fair"
        mmsg -d togglegaps
        ;;
    VF)
        echo "Vertical Fair"
        mmsg -d togglegaps
        ;;
    *)
        notify-send "Unhandled Layout Detected"
        ;;
esac
