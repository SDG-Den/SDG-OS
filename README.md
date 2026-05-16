# SDG-OS

mangoWC dotfiles with DMS integration


clone the repo and place the mango folder in your .config folder:
`git clone https://git.sdgcloud.nl/SDGDen/SDG-OS.git`

`cd SDG-OS`
`cp -r mango ~/.config`


you may need totweak around with some stuff to get application auto-theming to work, reference the DMS docs:
https://danklinux.com/docs/dankmaterialshell/application-themes

as well as the mangoWM docs: 
https://mangowm.github.io/docs


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


# installation of that software:

`sudo pacman -Syu ghostty firefox dms-shell yay git nautilus brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme`

`yay -S mangowm-git dsearch-bin`



