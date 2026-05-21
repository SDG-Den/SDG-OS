#!/bin/bash

echo "installing pre-requisites"

sudo pacman -Syu ghostty firefox dms-shell yay git nautilus brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme wl-copy hyprshot grim satty code-oss zoxide zsh zsh-theme-powerlevel10k eza kanshi

yay -S mangowm-git dsearch-bin

WORKINGDIR=$(pwd)

if [ $WORKINGDIR != "/home/$(whoami)/SDG-OS"]; then
    ln -sf $WORKINGDIR /home/$(whoami)
fi

mv /home/$(whoami)/.config/mango /home/$(whoami)/.config/mango-old-$(date %b%D)
cp -r /home/$(whoami)/SDG-OS/mango /home/$(whoami)/.config
mv /home/$(whoami)/.config/sdgos /home/$(whoami)/.config/sdgos-old-$(date %b%D)
cp -r /home/$(whoami)/SDG-OS/sdgos /home/$(whoami)/.config
mv /home/$(whoami)/.config/ghostty /home/$(whoami)/.config/ghostty-old-$(date %b%D)
cp -r /home/$(whoami)/SDG-OS/ghostty /home/$(whoami)/.config


echo "projects" > ~/.config/projectdir.state
mkdir -p ~/projects

echo "source /home/$(whoami)/.config/sdgos/zshconfig.zsh" >> ~/.zshrc

mv /home/$(whoami)/.zshrc /home/$(whoami)/.zshrc-old-$(date %b%D)
ln -sf /home/$(Whoami)/.config/sdgos/zshrc /home/$(whoami)
mv /home/$(whoami)/.p10k.zsh /home/$(whoami)/.p10k.zsh-old-$(date %b%D)
ln -sf /home/$(Whoami)/.config/sdgos/p10k.zsh /home/$(whoami)

chmod -R a+x ~/.config/sdgos

echo "installation complete! you should now be able to log out and switch to \"mango\""
