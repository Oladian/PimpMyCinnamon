#!/bin/bash

#Download and install theme and icons
wget -P /tmp/ https://cinnamon-spices.linuxmint.com/files/themes/Adapta-Nokto.zip && unzip /tmp/Adapta-Nokto.zip && mv /tmp/Adapta-Nokto /usr/share/themes/
wget -P /tmp/ https://launchpad.net/~papirus/+archive/ubuntu/papirus-dev/+build/16346002/+files/papirus-icon-theme_20190202-3032+pkg21~ubuntu18.04.1_all.deb -O papirus.deb && dpkg -i /tmp/papirus.deb

#Change wallpaper solid grey
gsettings set org.cinnamon.desktop.background primary-color '#111111111111'
gsettings set org.cinnamon.desktop.background picture-options 'none'

#Change theme and icons
gsettings set org.cinnamon.desktop.wm.preferences theme "Adapta-Nokto"
gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y-Dark-Grey"
gsettings set org.cinnamon.theme name "Mint-Y-Dark-Grey"
gsettings set org.cinnamon.desktop.interface icon-theme "Papirus-Dark"

#Load keybindings for terminal
dconf load /org/gnome/terminal/legacy/keybindings/ < mykeybindings
