#!/bin/bash

icon_spacing="${icon_spacing:-10}"

read -r OUTPUT
ICON="$(echo $OUTPUT | sed -n 's/.*icon:\([^ ]*\).*/\1/p')"
TEXT="$(echo $OUTPUT | sed -n 's/.*text:\"\(.*\)\".*/\1/p')"
COLOR="$(echo $OUTPUT | sed -n 's/.*color:\"\(.*\)\".*/\1/p')"
#COMMAND="$(echo $OUTPUT | sed 's/command:\(.\+\)\s/\1/')"

COLOR_INTRO="%{F${COLOR}}"
COLOR_INTRO="${COLOR:+$COLOR_INTRO}"
COLOR_OUTRO="%{F-}"
COLOR_OUTRO="${COLOR:+$COLOR_OUTRO}"

echo -e -n "${COLOR_INTRO}${ICON}%{O${ICON:+$icon_spacing}}${TEXT}${COLOR_OUTRO}"
