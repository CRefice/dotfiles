#!/bin/bash

kblist="$(lsusb | grep -E '\<Keyboard\>' | cut -d' ' -f1)"

if [ -z "$kblist" ] ; then
	kbmap="it winkeys"
else
	kbmap="us intl-unicode"
fi

setxkbmap $kbmap
