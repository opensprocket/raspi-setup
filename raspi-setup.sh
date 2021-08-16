#!/bin/bash -e

# Configure .bash_aliases
sudo touch ~/.bash_aliases
echo 'alias cls="clear"' | sudo tee -a ~/.bash_aliases
echo 'alias ll="ls -al"' | sudo tee -a ~/.bash_aliases

# Update, remove bloat + install apps
sudo apt update -y
sudo apt remove thonny geany -y
sudo apt install libreoffice syncthing syncthing-gtk tmux -y --no-install-recommends
sudo apt autoremove -y

# Disable screensleep
echo "Disabling screensleep..."
echo '@xset s off' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart
echo '@xset -dpms' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart
echo "Disabled screensleep..."

# Reboot
echo "This machine will reboot in 5 seconds..."
sleep 5
sudo reboot