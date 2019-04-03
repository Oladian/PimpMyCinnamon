#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "You should run the script as root!"
	exit
fi

#Download and install theme and icons
wget -P /tmp/ https://cinnamon-spices.linuxmint.com/files/themes/Adapta-Nokto.zip && unzip /tmp/Adapta-Nokto.zip -d /tmp/ && mv /tmp/Adapta-Nokto /usr/share/themes/
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | sh
#Change wallpaper solid grey
su $SUDO_USER -c "gsettings set org.cinnamon.desktop.background primary-color '#111111111111'"
su $SUDO_USER -c "gsettings set org.cinnamon.desktop.background picture-options 'none'"
#Change theme and icons
su $SUDO_USER -c "gsettings set org.cinnamon.desktop.wm.preferences theme 'Adapta-Nokto'"
su $SUDO_USER -c "gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark-Grey'"
su $SUDO_USER -c "gsettings set org.cinnamon.theme name 'Mint-Y-Dark-Grey'"
su $SUDO_USER -c "gsettings set org.cinnamon.desktop.interface icon-theme 'Papirus-Dark'"
#Load keybindings for terminal
su $SUDO_USER -c "dconf load /org/gnome/terminal/legacy/keybindings/ < resources/mykeybindings"
#Load json with menu config (icon for menu and taskbar icons)
cp resources/1.json ~/.cinnamon/configs/menu@cinnamon.org/1.json

echo "Enable HiDPI scaling factor setting?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) su $SUDO_USER -c "gsettings set org.cinnamon.desktop.interface scaling-factor 2"; break;;
		No ) exit;;
	esac
done
