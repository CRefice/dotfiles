#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

export AWT_TOOLKIT=MToolkit

# If an external monitor is connected, disable the in-built one
external_monitors=$(xrandr | awk '!/eDP-1/ && / connected / { print$1 }')
DPI=120
if [ ! -z "$external_monitors" ]; then
    xrandr --output eDP-1 --off --output ${external_monitors} --auto
fi

# If an external keyboard is connected, change keymap from it to us
if lsusb | grep -qi 'keyboard'; then
    keymap="us"
else
    keymap="it winkeys"
fi

setxkbmap "$keymap"
xsetroot -cursor_name left_ptr
numlockx &
redshift &
exec bspwm
