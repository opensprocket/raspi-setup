#/bin/bash -e

# make script executable
sudo chmod +x /home/pi/raspi-setup/start-kiosk.sh

# systemd kiosk script
# copy systemd kiosk.service entry to /lib/systemd/system folder
sudo cp /home/pi/raspi-setup/kiosk.service /lib/systemd/system/kiosk.service

echo "Make sure to set the hostname manually using raspi-config & change the url in start-kiosk.sh!"