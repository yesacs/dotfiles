#!/bin/bash 

#https://techienotes.blog/2019/01/10/set-fractional-display-scaling-on-ubuntu-18-10-xorg/

gsettings set org.gnome.desktop.interface scaling-factor 2
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor': <2>}" 
xrandr --output eDP-1 --scale $1x$1
