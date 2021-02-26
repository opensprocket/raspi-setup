#!/bin/bash -e

# Prompt for Hostname
read -p "Please input the hostname of the machine:" -r -s HOSTNAME

sudo hostnamectl set-hostname $HOSTNAME

echo "Hostname has been changed successfully!" 
echo "Close and reopen terminal once script finishes to verify the change."

# Set locale
echo -e "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
sudo locale-gen


# Update, remove bloat + install apps
sudo apt update -y \
sudo apt remove thonny geany -y \
sudo apt install libreoffice syncthing syncthing-gtk -y --no-install-recommends \
sudo apt autoremove -y


# Disable screensleep
echo '@xset s off' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart
echo '@xset -dpms' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart
