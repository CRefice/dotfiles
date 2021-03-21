#!/bin/sh

#        -lf/nf/cf color
#            Defines the foreground color for low, normal and critical notifications respectively.
#
#        -lb/nb/cb color
#            Defines the background color for low, normal and critical notifications respectively.
#
#        -lfr/nfr/cfr color
#            Defines the frame color for low, normal and critical notifications respectively.

[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

pidof dunst && killall dunst

dunst -lf  "${foreground:-#ffffff}" \
      -nf  "${foreground:-#cccccc}" \
      -cf  "${foreground:-#999999}" \
      -lb  "${background:-#eeeeee}" \
      -nb  "${background:-#bbbbbb}" \
      -cb  "${background:-#888888}"  > /dev/null 2>&1 &
