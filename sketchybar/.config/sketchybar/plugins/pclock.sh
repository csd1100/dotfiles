#!/usr/bin/env bash

case $SENDER in
"mouse.entered")
	LABEL="$(date '+%B %d %Y, %A - %H:%M')"
	;;
*)
	LABEL="$(date '+%A - %H:%M')"
	;;
esac
sketchybar --set $NAME label="$LABEL"
