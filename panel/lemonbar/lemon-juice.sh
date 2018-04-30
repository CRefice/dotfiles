#!/bin/bash

pkill bar

MONITORHRES="$(xrandr | awk -F 'current' 'NR==1 {print strtonum($2)}')"

bar_dimensions="${bar_dimensions:-$MONITORHRES+0+0}"
bar_color="${bar_color:-#09000F}"
bar_font="${bar_font:-Roboto:size=10}"
bar_icon_font="${bar_icon_font:-Font Awesome 5 Free:style=Solid:size=11}"
bar_weather_font="${bar_weather_font:-Weather Icons:size=11}"

~/projects/dotfiles/panel/lemonbar/format-bar.sh | lemonbar -g $bar_dimensions -B "$bar_color" -f "$bar_font" -f "$bar_icon_font" -o -3 -f "$bar_weather_font" -f "Font Awesome 5 Brands:size=13" -p &
xdo above -t $(xdo id -n root) $(xdo id -n lemonbar)
