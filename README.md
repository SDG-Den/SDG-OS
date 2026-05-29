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


you can update by running `git pull` followed by the update script, do note that updating will remove any customizations you've made to your configs, you can update individual components, and reference the git diffs on github to see what was changed to merge those changes into your own config. 

## manual install

clone the repo.

`git clone https://git.sdgcloud.nl/SDGDen/SDG-OS.git`

copy the files to your .config folder if you want to modify them yourself

`cd SDG-OS`

`cp -r mango ~/.config`

`cp -r sdgos ~/.config`

`cp -r ghostty ~/.config`

`cp -r DankMaterialShell ~/.config`


make the scripts in the sdgos folder executable:

`sudo chmod -R a+x ~/.config/sdgos`

copy over the zsh config:

`cp /home/$(Whoami)/.config/sdgos/zshrc /home/$(whoami)/.zshrc`

`cp /home/$(Whoami)/.config/sdgos/p10k.zsh /home/$(whoami)/.p10k.zsh`

create and set your project directory:

`mkdir -p ~/<My_Project_Directory>`

`echo "<My_Project_Directory>" > ~/.config/projectdir.state`


example with a subdirectory:

`mkdir -p ~/Documents/Projects`

`echo "Documents/Projects" > ~/.config/projectdir.state`


the install script normally also asks you if you want to install unipkg or my dotfile sync script. you can install those manually from their github pages.



## post-install

you may need to tweak around with some stuff to get application auto-theming to work, reference the DMS docs:
https://danklinux.com/docs/dankmaterialshell/application-themes

as well as the mangoWM docs: 
https://mangowm.github.io/docs


please be sure to tweak the display config using dms or by editing monitors.conf to match your displays! 


for keybinds, press super+k. these are automatically updated from your binds.conf file. 


# needed software:

- (aur)mangowm-git
- (aur)dsearch-bin
- ghostty 
- shelly 
- firefox 
- dms-shell 
- yay git 
- nautilus 
- zsh-history-substring-search 
- zsh-syntax-highlighting 
- zsh-autosuggestions 
- zsh-doc 
- stow 
- brightnessctl 
- pipewire-pulse 
- pipewire 
- matugen 
- adw-gtk-theme 
- wl-copy 
- hyprshot 
- grim 
- satty 
- code-oss 
- zoxide 
- zsh 
- zsh-theme-powerlevel10k 
- eza 
- kanshi 
- ttf-nerd-fonts-symbols-common 
- ttf-nerd-fonts-symbols-mono 
- ttf-nerd-fonts-symbols 
- ttf-cascadia-code-nerd 
- ttf-cascadia-mono-nerd 
- ttf-terminus-nerd 
- ttf-firacode-nerd 
- ttf-ubuntu-nerd



# installation of that software:

`sudo pacman -Syu ghostty shelly firefox dms-shell yay git nautilus zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions zsh-doc stow brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme wl-copy hyprshot grim satty code-oss zoxide zsh zsh-theme-powerlevel10k eza kanshi ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-terminus-nerd ttf-firacode-nerd ttf-ubuntu-nerd`

`yay -S mangowm-git dsearch-bin`

the install script also takes care of this.

# mango-config editor script

you can open the mango config editor with super+m, this opens a terminal in which you can select a config file and see the contents of that config file. 

this script has a variable for the editor, it uses micro by default, but you can change the line "app=micro" to any editor you'd like.

# mango-config viewer script

you can open this with super+alt+m, you can select a mango config file just like with the editor, but instead of opening in a text editor, this will open the config in an interactive viewer that will show you the details of the selected config line, pressing alt+b will open the documentation for it in a new tab in your open firefox window

# documentation quicklinks

pressing super+shift+m opens a terminal with quick links to various pieces of documentation and a couple of built-in searchable reference lists. 

reference lists included:
Dank Material Shell - full IPC usage (commands)
MangoWM - Config File options
MangoWM - dispatchers (for keybinds and mango IPC)
MangoWM - IPC commands

this also contains all the mangoWM documentation sites, useful dankmaterial shell documentation pages, ghostty docs and the cachyOS + arch wiki's. 


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

keybinds for these are disabled by default in favour of Satty and unipkg, but can be enabled in the mango binds config by uncommenting the lines.

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







