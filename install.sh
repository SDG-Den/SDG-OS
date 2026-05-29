#!/bin/bash

echo "installing pre-requisites"

sudo pacman -Syu ghostty shelly firefox dms-shell yay git nautilus zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions zsh-doc stow brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme hyprshot grim satty code shelly zoxide zsh zsh-theme-powerlevel10k eza kanshi ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-terminus-nerd ttf-firacode-nerd ttf-ubuntu-nerd

yay -S mangowm-git dsearch-bin

WORKINGDIR=$(pwd)

if [ $WORKINGDIR != "/home/$(whoami)/SDG-OS"]; then
    ln -sf $WORKINGDIR /home/$(whoami)
fi

mv /home/$(whoami)/.config/mango /home/$(whoami)/.config/mango-old-$RANDOM
cp -r /home/$(whoami)/SDG-OS/mango /home/$(whoami)/.config
mv /home/$(whoami)/.config/sdgos /home/$(whoami)/.config/sdgos-old-$RANDOM
cp -r /home/$(whoami)/SDG-OS/sdgos /home/$(whoami)/.config
mv /home/$(whoami)/.config/ghostty /home/$(whoami)/.config/ghostty-old-$RANDOM
cp -r /home/$(whoami)/SDG-OS/ghostty /home/$(whoami)/.config


echo "projects" > ~/.config/projectdir.state
mkdir -p ~/projects

mv /home/$(whoami)/.zshrc /home/$(whoami)/.zshrc-old-$RANDOM
cp /home/$(whoami)/.config/sdgos/zshrc /home/$(whoami)/.zshrc
mv /home/$(whoami)/.p10k.zsh /home/$(whoami)/.p10k.zsh-old-$RANDOM
cp /home/$(whoami)/.config/sdgos/p10k.zsh /home/$(whoami)/.p10k.zsh

chmod -R a+x ~/.config/sdgos

echo "SDG-OS comes with the following optional extra scripts:"
echo " - unipkg: universal package management TUI scripting"
echo " - dotfile-git-sync: a script to make migrating your dotfiles to a github directory easy"
echo ""
read -p "Do you want to install the additional scripts? [Y/n] " -n 1 -r
echo  # Move to a new line
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    git clone https://github.com/SDG-Den/unipkg ~/projects/unipkg
    git clone https://github.com/SDG-Den/dotfile-git-sync ~/projects/dotfile-git-sync
    echo "installing unipkg"
    bash -c "~/projects/unipkg/install.sh"
    mkdir -p ~/.local/share/dotfile-git-sync
    cp ~/projects/dotfile-git-sync/dotfile-git-sync ~/.local/share/dotfile-git-sync
    sudo ln -sf /home/$(whoami)/.local/share/dotfile-git-sync/dotfile-git-sync /usr/bin
    chmod a+x ~/.local/share/dotfiles-git-sync/dotfile-git-sync

else
    echo "optional scripts skipped, you can always install them manually later."
fi




echo "installation complete! you should now be able to log out and switch to \"mango\""
