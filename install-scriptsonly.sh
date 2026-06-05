#!/bin/bash

WORKINGDIR=$(pwd)

cp -r $WORKINGDIR/sdgos ~/.config

sudo ln -sf /home/$(whoami)/.config/sdgos/fastfetch/fetch-conf.sh /usr/bin/fetchconf
sudo ln -sf /home/$(whoami)/.config/sdgos/fastfetch/fetch.sh /usr/bin/fetch

sudo ln -sf /home/$(whoami)/.config/sdgos/config-overview/menu.sh /usr/bin/mangoconf-viewer

sudo ln -sf /home/$(whoami)/.config/sdgos/help/cmd-help.sh /usr/bin/cmdhelp

sudo ln -sf /home/$(whoami)/.config/sdgos/tuis/layout-switch.sh /usr/bin/mango-layout

sudo ln -sf /home/$(whoami)/.config/sdgos/tuis/projectselect.sh /usr/bin/projects
echo "projects" > ~/.config/projectdir.state

sudo ln -sf /home/$(whoami)/.config/sdgos/wallpapers/setwallpapergroup.sh /usr/bin/wallpaper-select

