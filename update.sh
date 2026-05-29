#!/bin/bash

echo "updating git repo"

git pull


echo "re-installing/updating pre-requisites"

sudo pacman -Syu ghostty firefox dms-shell yay git nautilus zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions zsh-doc stow brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme wl-copy hyprshot grim satty code-oss zoxide zsh zsh-theme-powerlevel10k eza kanshi ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-terminus-nerd ttf-firacode-nerd ttf-ubuntu-nerd

yay -S mangowm-git dsearch-bin

WORKINGDIR=$(pwd)

if [ $WORKINGDIR != "/home/$(whoami)/SDG-OS"]; then
    ln -sf $WORKINGDIR /home/$(whoami)
fi

RAND=$RANDOM

read -p "do you want to update and refresh your mango config? this will reset you back to SDG-OS defaults [y/N] " -n 1 -r REPLY
echo  
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mv /home/$(whoami)/.config/mango /home/$(whoami)/.config/mango-old-$RAND
    cp -r /home/$(whoami)/SDG-OS/mango /home/$(whoami)/.config
    sleep 5
    echo "old version of the config moved to mango-old-$RAND and new version copied in."
else
    return 0
fi

echo "re-building SDGOS scripts dir"
mv /home/$(whoami)/.config/sdgos /home/$(whoami)/.config/sdgos-old-$RAND
cp -r /home/$(whoami)/SDG-OS/sdgos /home/$(whoami)/.config
sleep 5
echo "SDGOS scripts dir re-built"

read -p "do you want to update and refresh your ghostty config? this will reset you back to SDG-OS defaults [y/N] " -n 1 -r REPLY2
echo  
if [[ $REPLY2 =~ ^[Yy]$ ]]; then
    mv /home/$(whoami)/.config/ghostty /home/$(whoami)/.config/ghostty-old-$RAND
    cp -r /home/$(whoami)/SDG-OS/ghostty /home/$(whoami)/.config
    sleep 5
    echo "old ghostty config moved to ghostty-old-$RAND and new config copied in"
else
    return 0
fi

read -p "do you want to update and refresh your zshrc config? this will reset you back to SDG-OS defaults [y/N] " -n 1 -r REPLY3
echo  
if [[ $REPLY3 =~ ^[Yy]$ ]]; then
    mv /home/$(whoami)/.zshrc /home/$(whoami)/.zshrc-old-$RAND
    cp /home/$(Whoami)/.config/sdgos/zshrc /home/$(whoami)/.zshrc
    sleep 5
    echo "old zshrc moved to .zshrc-old-$RAND and new zshrc copied in." 
else
    return 0
fi

read -p "do you want to update and refresh your p10k config? this will reset you back to SDG-OS defaults [y/N] " -n 1 -r REPLY4
echo  
if [[ $REPLY4 =~ ^[Yy]$ ]]; then
mv /home/$(whoami)/.p10k.zsh /home/$(whoami)/.p10k.zsh-old-$RAND
cp /home/$(Whoami)/.config/sdgos/p10k.zsh /home/$(whoami)/.p10k.zsh
sleep 5
echo "old p10k moved to .p10k.zsh-old-$RAND and new p10k config copied in"
else
    return 0
fi

echo "fixing perms on SDGOS folder"
chmod -R a+x ~/.config/sdgos
sleep 3
echo "perms fixed, update complete."
echo ""
echo "when you've confirmed functionality of the update, "