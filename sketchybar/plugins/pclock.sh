#!/usr/bin/env sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

case $SENDER in
"mouse.entered")
    LABEL="$(date '+%B %d %Y, %H:%M')"
	;;
*)
    LABEL="$(date '+%H:%M')"
	;;
esac
sketchybar --set $NAME label="$LABEL"
