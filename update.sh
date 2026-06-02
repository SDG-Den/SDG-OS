#!/bin/bash

echo "updating git repo"

git pull


echo "re-installing/updating pre-requisites"

sudo pacman -Syu ghostty shelly firefox dms-shell jp2a yay git adwsteamgtk yazi cava btop tela-circle-icon-theme-black wl-clipboard nautilus zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions zsh-doc stow brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme hyprshot grim satty code shelly zoxide zsh zsh-theme-powerlevel10k eza ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-terminus-nerd ttf-firacode-nerd ttf-ubuntu-nerd

yay -S mangowm-git dsearch-bin

WORKINGDIR=$(pwd)

if [ $WORKINGDIR != "/home/$(whoami)/SDG-OS" ]; then
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
fi

read -p "do you want to update and refresh your DankMaterial Shell config? this will reset you back to SDG-OS defaults [y/N] " -n 1 -r REPLY
echo  
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mv /home/$(whoami)/.config/DankMaterialShell /home/$(whoami)/.config/DankMaterialShell-old-$RAND
    cp -r /home/$(whoami)/SDG-OS/DankMaterialShell /home/$(whoami)/.config
    sleep 5
    echo "old version of the config moved to DankMaterialShell-old-$RAND and new version copied in."
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
fi

read -p "do you want to update and refresh your zshrc config? this will reset you back to SDG-OS defaults [y/N] " -n 1 -r REPLY3
echo  
if [[ $REPLY3 =~ ^[Yy]$ ]]; then
    mv /home/$(whoami)/.zshrc /home/$(whoami)/.zshrc-old-$RAND
    cp /home/$(Whoami)/.config/sdgos/zshrc /home/$(whoami)/.zshrc
    sleep 5
    echo "old zshrc moved to .zshrc-old-$RAND and new zshrc copied in." 
fi

read -p "do you want to update and refresh your p10k config? this will reset you back to SDG-OS defaults [y/N] " -n 1 -r REPLY4
echo  
if [[ $REPLY4 =~ ^[Yy]$ ]]; then
mv /home/$(whoami)/.p10k.zsh /home/$(whoami)/.p10k.zsh-old-$RAND
cp /home/$(Whoami)/.config/sdgos/p10k.zsh /home/$(whoami)/.p10k.zsh
sleep 5
echo "old p10k moved to .p10k.zsh-old-$RAND and new p10k config copied in"
fi

echo "fixing perms on SDGOS folder"
chmod -R a+x ~/.config/sdgos
sleep 3
echo "perms fixed, update complete."
echo ""
echo "please reboot."