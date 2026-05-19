# SDG-OS

mangoWC dotfiles with DMS integration as well as a couple of other things.

custom stuff:
- pacman and AUR TUIs
- tips
- auto-update
- mango configuration manager TUI
- project manager TUI
- screenshots scripts 

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
stow
zoxide
zsh
zsh-theme-powerlevel10k
eza
kanshi


# installation of that software:

`sudo pacman -Syu ghostty firefox dms-shell yay git nautilus brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme wl-copy hyprshot grim satty stow zoxide zsh zsh-theme-powerlevel10k eza kanshi`

`yay -S mangowm-git dsearch-bin`


# mango-config editor script

you can open the mango config editor with super+m, this opens a terminal in which you can select a config file and see the contents of that config file. 

this script has a variable for the editor, it uses micro by default, but you can change the line "app=micro" to any editor you'd like.


# ghostty config

SDG-OS ships with a ghostty config that syncs your theme with DMS, sets ghostty to use zsh and configure some basic keybinds for multi-window:
ctrl+arrow keys for splitting the pane
ctrl+r to reload the config

you can exit a pane by simply typing exit. panes are auto-focused with the mouse and can be resized using mouse drags. 

# zsh config

zsh is set up with a couple of interesting tweaks:

eza replaces the standard ls command and zoxide replaces the cd command, allowing you to more easily navigate your system.

find has been replaced with a fzf implementation, and the command microfind will automatically open the selected file in micro. both of these have previews.

lastly, zsh also has some suffix aliasses, which allow you to open specific filetypes in their prefered program by just entering the file as the command. 

# installer TUIs

SDG-OS comes with installer TUIs for both pacman and the AUR

these can be spawned with super+y for pacman or super+shift+y for AUR

alternatively, you can open them in the terminal using `pacgui` and `aurgui`

# Tips

SDG-OS comes with a built in tips system
a random tip is shown when ghostty is opened as well as when the "tipme" command is ran
you can also see all tips via fzf using the "alltips" command
lastly, you'll get a notification popup with a random tip when you press SUPER+0


# project manager TUI

SDG-OS comes with an interactive script bound to super+shift+tab, this will preview the paths to all of the git repositories within your projects directory (default ~/projects)

on the right side, you'll see the contents of that git repository as well as the README.md file. 

when you select a repository, the screen will close and in its place, an instance of VSCode opens with that repository already selected. 

to change your projects dir, you can do the following:

`echo "MyProjects/Subdir" > ~/.config/projectdir.state`

this will set your projects dir to /home/YourUserName/MyProjects/Subdir

you cannot set the projects dir outside of your home folder, it is also not advised to set it directly to your home folder as including .local will cause it to include all your AUR packages.





# contributing

anyone with an SDGCloud account can work on forks of this repository and send code in for review, just shoot me a message if you have something interesting for the config and i'll take a look at it! 


# requesting features

just message me on discord lmao. 



# Updates:

19-05-2026 - updated ghostty config to use alt+arrows instead of ctrl+arrows for panes, added super+alt+numbers to toggle workspaces for multi-workspace view

18-05-2026 - added tips, better ghostty and zsh configuration and a project manager TUI to open your github repo's in VSCode. 

17-05-2026 - added auto-updater as well as install script.

17-05-2026 - added screenshot capability through scripts, first run modal (opens settings and keybinds popup on first boot) and added a somewhat-simple mango config editor script.




