#!/bin/sh
# This script is located in ~/.local/bin.
# It's provided as an example script to show how
# the kiosk session works.  At the moment, the script
# just starts a text editor open to itself, but it
# should get customized to instead start a full screen
# application designed for the kiosk deployment.

sleep 5
# Properly rotates touchscreen input to work with Logitech Touchscreen
xinput set-prop 'pointer:ILITEK ILITEK-TP' 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1
xset s off
xset s noblank
xset -dpms

if [ ! "$(pidof firefox)" ]
then
        firefox --kiosk http://homeassistant-ip/front-door/default_view?BrowserID=frontdoor
fi

sleep 1.0
exec "$0" "$@"
