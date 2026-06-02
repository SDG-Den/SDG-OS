#!/bin/bash

WORKINGDIR=$(pwd)

cp -r $WORKINGDIR/sdgos ~/.config

ln -sf /home/$(whoami)/.config/sdgos/fastfetch/fetch-conf.sh /usr/bin/fetchconf
ln -sf /home/$(whoami)/.config/sdgos/fastfetch/fetch.sh /usr/bin/fetch

ln -sf /home/$(whoami)/.config/sdgos/config-overview/menu.sh /usr/bin/mangoconf-viewer

ln -sf /home/$(whoami)/.config/sdgos/help/cmd-help.sh /usr/bin/cmdhelp

ln -sf /home/$(whoami)/.config/sdgos/tuis/layout-switch.sh /usr/bin/mango-layout

ln -sf /home/$(whoami)/.config/sdgos/tuis/projectselect.sh /usr/bin/projects
echo "projects" > ~/.config/projectdir.state

ln -sf /home/$(whoami)/.config/sdgos/wallpapers/setwallpapergroup.sh /usr/bin/wallpaper-select

