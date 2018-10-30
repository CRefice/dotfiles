TITLE="$(playerctl metadata title 2> /dev/null)" || exit 1
ARTIST="$(playerctl metadata artist 2> /dev/null)" || exit 1
printf "%s - %s" "$ARTIST" "$TITLE"
