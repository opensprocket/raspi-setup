#!/bin/bash
# Disable screensleep
xset s noblank
xset s off
xset -dpms

# Start Kiosk 
# Replace URL with what you want to automatically open!
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk URLGOESHERE &