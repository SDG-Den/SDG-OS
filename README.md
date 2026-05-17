# SDG-OS

mangoWC dotfiles with DMS integration

## auto-install

clone the repository into your home (~) directory:

`cd ~`

`git clone https://git.sdgcloud.nl/SDGDen/SDG-OS.git`

make the install script executable

`cd SDG-OS`

`chmod a+x install.sh`

run the install script

`./install.sh`

this will also set up automatic updates. any files you manually alter will stop auto-updating.

updates run automatically on startup via git pull, you can update manually by going into the SDG-OS directory and running `git pull`

to turn updates off, run the following command:

`echo "off" > ~/.coinfig/SDGupdate.state`

## manual install

clone the repo.

`git clone https://git.sdgcloud.nl/SDGDen/SDG-OS.git`

copy the files to your .config folder if you want to modify them yourself

`cd SDG-OS`

`cp -r mango ~/.config`

`cp -r sdgos ~/.config`

or use stow to symlink them if you want automatic updates

`cd SDG-OS`

`stow .`

or manually symlink them

`sudo ln -sf /home/$(whoami)/SDG-OS/mango /home/$(whoami)/.config`

`sudo ln -sf /home/$(whoami)/SDG-OS/sdgos /home/$(whoami)/.config`

then make the scripts in the sdgos folder executable:

`sudo chmod -R a+x ~/.config/sdgos`

lastly, pick whether you want to use automatic updates or not (only relevant if you used stow or symlinks)

`echo "on" > ~/.config/SDGupdate.state`

use "on" for automatic updates on boot or "off" to not have automatic updates



manual updates can be done by CDing into the SDG-OS directory and running `git pull`


you may need to tweak around with some stuff to get application auto-theming to work, reference the DMS docs:
https://danklinux.com/docs/dankmaterialshell/application-themes

as well as the mangoWM docs: 
https://mangowm.github.io/docs


please be sure to tweak the display config using dms or by editing monitors.conf to match your displays! 


for keybinds, press super+k. these are automatically updated from your binds.conf file. 


# needed software:

(aur)mangowm-git
ghostty
firefox
dms-shell
nautilus
brightnessctl
pipewire-pulse
pipewire
(aur)dsearch-bin
matugen
adw-gtk-theme
wl-copy
hyprshot
grim
satty
fzf
micro


# installation of that software:

`sudo pacman -Syu ghostty firefox dms-shell yay git nautilus brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme wl-copy hyprshot grim satty`

`yay -S mangowm-git dsearch-bin`


# mango-config editor script

you can open the mango config editor with super+m, this opens a terminal in which you can select a config file and see the contents of that config file. 

this script has a variable for the editor, it uses micro by default, but you can change the line "app=micro" to any editor you'd like.



# Updates:

17-05-2026 - added auto-updater as well as install script.

17-05-2026 - added screenshot capability through scripts, first run modal (opens settings and keybinds popup on first boot) and added a somewhat-simple mango config editor script.




