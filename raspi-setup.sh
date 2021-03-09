#!/bin/bash -e

# Set locale
echo -e "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
sudo locale-gen

# Update, remove bloat + install apps
sudo apt update -y
sudo apt remove thonny geany -y
sudo apt install libreoffice syncthing syncthing-gtk -y --no-install-recommends
sudo apt autoremove -y


# Disable screensleep
echo '@xset s off' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart
echo '@xset -dpms' | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart

#
# Create doterrala
#

# Get password
read -p "Password for doterrala:" -r -s PASS
# (echo -e $PASS; echo -e $PASS) | sudo passwd doterrala

# Create user account
sudo useradd -p $(openssl passwd -1 $PASS) doterrala

sudo usermod -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,input,netdev,lpadmin,gpio,i2c,spi doterrala



#
# Enable VNC
#

sudo apt install realvnc-vnc-server -y
sudo systemctl enable vncserver-x11-serviced.service &&
sudo systemctl start vncserver-x11-serviced.server
echo "VNC has been enabled for this machine."

#
# Disable pi user
#

# Remove pi from sudo group
sudo gpasswd -d pi sudo

# Remove pi sudoers file
sudo rm /etc/sudoers.d/010_pi-nopasswd

# Disable password for pi
# sudo passwd -l pi


# Prompt for Hostname - Make sure this is the last thing to do!
# read -p "Please input the hostname of the machine:" -r -s HOSTNAME

# sudo hostnamectl set-hostname $HOSTNAME

# echo "Hostname has been changed successfully!" 
# echo "Close and reopen terminal once script finishes to verify the change."

# Reboot
echo "This machine will reboot in 5 seconds..."
sleep 5
sudo reboot