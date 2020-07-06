#!/usr/bin/env sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

setbg &		# Set the background
# Switch to DE with Caps as Mod/Escape
setxkbmap -layout de -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &
sxhkd &	# Bind keys
# Properties button extra Mod/Escape
xmodmap -e 'keycode 135 = Super_R' &
xset r rate 300 50 &	# Speed xrate up
unclutter &		# Remove mouse when idle
xcompmgr &		# xcompmgr for transparency
dunst &			# dunst for notifications
mpdupdate &
calcurse --daemon &
cadmus &

exec i3
