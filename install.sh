#!/bin/bash

echo "installing pre-requisites"

sudo pacman -Syu ghostty firefox dms-shell yay git nautilus brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme wl-copy hyprshot grim satty stow zoxide zsh zsh-theme-powerlevel10k eza

yay -S mangowm-git dsearch-bin

WORKINGDIR=$(pwd)

if [ $WORKINGDIR != "/home/$(whoami)/SDG-OS"]; then
    ln -sf $WORKINGDIR /home/$(whoami)
fi

stow .

echo "on" > ~/.config/SDGupdate.state

echo "source /home/$(whoami)/.config/sdgos/zshconfig.zsh" >> ~/.zshrc


chmod -R a+x ~/.config/sdgos

echo "installation complete! you should now be able to log out and switch to \"mango\""
