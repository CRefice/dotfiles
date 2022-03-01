#!/bin/sh

pidof dunst && killall dunst
dunst &
