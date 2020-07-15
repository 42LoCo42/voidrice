#!/usr/bin/env sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

setbg &		# Set the background
# Switch to DE with caps to access APL
setxkbmap -layout de,apl -option grp:caps_switch &
sxhkd &	# Bind keys
# Properties button extra Mod/Escape
xmodmap -e 'keycode 135 = Super_R' &
xset r rate 300 50 &	# Speed xrate up
unclutter &		# Remove mouse when idle
xcompmgr &		# xcompmgr for transparency
dunst &			# dunst for notifications
mpdupdate &
calcurse --daemon &

exec i3
