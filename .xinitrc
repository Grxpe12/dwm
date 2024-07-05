#!/bin/sh

# Set keyboard layout
setxkbmap pl & 

## Autostart

exec xfce4-power-manager &                       # For brightness control
exec lxqt-powermanagement &                      # Display battery
exec nm-applet &                                 # NetworkManager GUI
exec blueman-applet &                            # Bluetooth 
exec dunst &                                     # Notification daemon
#exec dwmbar &                                   # Script for the status bar 
#exec slstatus
xwallpaper --stretch ~/wallpapers/dark-apple.jpg # Wallpaper


## dwm

exec dwm




