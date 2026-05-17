# SDG-OS

mangoWC dotfiles with DMS integration


clone the repo and place the mango and sdgos folders in your .config folder:
`git clone https://git.sdgcloud.nl/SDGDen/SDG-OS.git`

`cd SDG-OS`
`cp -r mango ~/.config`
`cp -r sdgos ~/.config`

then make the scripts in the sdgos folder executable:
`sudo chmod -R a+x ~/.config/sdgos`

you can also use stow to symlink these to your .config folder instead, this allows you to store the files anywhere and also update via git pull, but means you cannot personally alter the config. 


you may need totweak around with some stuff to get application auto-theming to work, reference the DMS docs:
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

17-05-2026 - added screenshot capability through scripts, first run modal (opens settings and keybinds popup on first boot) and added a somewhat-simple mango config editor script.



