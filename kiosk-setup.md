# Pre-requisite Setup

Run `raspi-setup.sh` as normal, then follow the instructions below.

## Setup using `systemd` method (preferred)

Make sure the `start-kiosk.sh` file has the correct URL added!

To start up the kiosk, do the following: 

Open a terminal
`cd /raspi-setup` (go to the raspi-setup directory, your path may be different!)
`chmod +x start-kiosk.sh` (make the start-kiosk.sh script executable)
`nano start-kiosk.sh` (edit & replace URLGOESHERE with the full URL! - keep the trailing & to ensure it spawns as a separate process)
`sudo systemd start kiosk.service` (start the kiosk systemd service, run as sudo)
`sudo systemd status kiosk.service` (should say that it's running, if not verify the path to the `start-kiosk.sh` script in the `/lib/systemd/system/kiosk.service` file)

### Troubleshooting

If no systemd service is present, verify that the following file exists and is configured correctly: `/lib/systemd/system/kiosk.service`
- The `ExecStart` line will need to have the correct path to the script 
    - If you stored the `start-kiosk.sh` script in a location other than `/home/pi/raspi-setup/` (navigate to where script is stored and run `pwd` to compare)

## Setup using `xdg` method (deprecated)

This method is only verified to be working on older builds of Raspbian/Raspberry Pi OS, Debian Buster and older - please try the `systemd` method first!

Make sure to edit the `kiosk.desktop` file to include the proper URL!

### Configuration

Open a terminal
`cd /raspi-setup` (go to the raspi-setup directory, your path may be different!)
`sudo cp ./kiosk.desktop /etc/xdg/autostart/kiosk.desktop` (copy the `kiosk.desktop` file to the `/etc/xdg/autostart/` folder)
`sudo reboot` (restart the comptuer, verify that it comes up correctly)

