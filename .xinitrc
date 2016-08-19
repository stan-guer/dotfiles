#!/bin/sh

xrdb -load .Xresources

# Trackpoint settings
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.95

# keyboard layout

setxkbmap -layout us,ru -option grp:alt_shift_toggle

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
   for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
     [ -x "$f" ] && . "$f"
   done
   unset f
fi


#sudo redshift -l 48.1333:11.5667

exec i3

