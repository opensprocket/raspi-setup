#!/bin/bash -e

# Configure .bash_aliases
sudo touch /home/pi/.bash_aliases
echo 'alias cls="clear"' | sudo tee -a /home/pi/.bash_aliases
echo 'alias ll="ls -al"' | sudo tee -a /home/pi/.bash_aliases

# Update, remove bloat + install apps
sudo apt update -y
sudo apt remove thonny geany -y
sudo apt install libreoffice syncthing syncthing-gtk tmux ntfs-3g fail2ban -y --no-install-recommends
sudo apt autoremove -y

# Disable screensleep
echo "Disabling screensleep..."
echo '@xset s off' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart
echo '@xset -dpms' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart
echo "Disabled screensleep..."

# Make reconfigure.sh executable
sudo chmod +x /home/pi/raspi-setup/reconfigure.sh
sudo chmod +x /home/pi/raspi-setup/kiosk-configure.sh
sudo ./reconfigure.sh

echo "Make sure to set the hostname manually using raspi-config!"


# Reboot
# echo "This machine will reboot in 5 seconds..."
# sleep 5
# sudo reboot