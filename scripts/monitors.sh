#!/bin/bash

firefox_profile="ax9ogawo.default-release"

# Takes scale factor as argument
function firefox_scale {
	preffile="${HOME}/.mozilla/firefox/${firefox_profile}/user.js"
	echo "user_pref(\"layout.css.devPixelsPerPx\", \"$1\");" > "$preffile"
}

# Takes dpi factor as argument.
# Since we can't really modify variables
# at runtime, we will write to .Xresdpi,
# which is then #included by the general .Xresources file.
function xres_scale {
	echo "Xft.dpi: $1" > "${HOME}/.Xresdpi"
}

monlist="$(xrandr | grep -E '\<connected\>' | cut -d' ' -f1)"
moncount="$(echo $monlist | wc -w)"

if [ "$moncount" -lt "2" ] ; then
	# Only one monitor (internal), scale up everything
	dpi=120
	scale=1.25
else
	# More than one monitor, scale internal one down
	dpi=96
	scale=1
	xrandr --output eDP-1 --left-of HDMI-2
fi

firefox_scale "$scale"
xres_scale "$dpi"
xrandr --dpi "$dpi"
