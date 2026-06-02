# scripts

the following scripts are provided as commands, both using install-scriptsonly.sh and install.sh

`fetchconf` and `fetch`

fetchconf is a TUI that allows you to configure fetch, which is a fastfetch wrapper. 

fetchconf allows you to select any ASCII artwork in ~/.config/sdgos/fastfetch/gen

fetchconf also turns any images provided in ~/.config/sdgos/fastfetch/src into ASCII artwork, it'll update all artworks every time the TUI is started.

after selecting an artwork, you can then select the formatting of your fetch command, you can add configurations to ~/.config/sdgos/fastfetch/conf to add them to the menu.

once this is all done, running "fetch" will run fastfetch with the configured image and configuration.

image and configuration are stored in ~/.config/fetch.state




`mangoconf-viewer` and `mangoconf-editor`

these two will allow you to view and edit your mango config respectively. both will open on a list of your configuration files in ~/.config/mango with a preview, and on selection, editor will open that file in micro while viewer will open that file in a tui where you can go through the config line by line and see details about that setting.

`cmdhelp`

this is a simple TUI interface showing you the TLDR help for various basic linux commands, pressing enter on any of the commands opens the man page for the command.


`mango-layout`

this is a TUI to select the mango layout on your current focused monitor/tag.


`projects`

this is a TUI that allows you to browse through the git repositories you have available in your projects directory, seeing both the list of files and readme, and select one to open it in code-oss/vscode. 

project directory defaults to ~/projects, but is configurable by changing the contents of ~/.config/projectdir.state

example 1:
to change the project dir to ~/mydir, run `echo "mydir" > ~/.config/projectdir.state`

example 2:
to change the project dir to ~/Documents/MyGitProjects, run `echo "Documents/MyGitProjects" > ~/.config/projectdir.state



`wallpaper-select`

this is a script for DMS that allows you to select wallpapers with corresponding color settings. each group of wallpapers comes with a wallpaper.conf file with the following keys:

```
Theme_Category:dynamic # options are: generic (set color),dynamic (matugen/auto), custom (custom theme) or registry (preset themes via browse)
Generic_Color:dynamic # takes the color names from the "generic" selection in DMS, dynamic for matugen or custom for both custom and preset themes) 
Matugen:vibrant # only relevant if picking dynamic above, sets the matugen palette. 
Mode:dark # sets dark or light mode
Preset:- # only relevant if picking registry or custom, custom themes would have to be stored under ~/.config/DankMaterialShell/themes/yourthemename/theme.json.


```

will pick the first wallpaper in the folder to start, cycling is not affected by the script and is set through DMS. 
