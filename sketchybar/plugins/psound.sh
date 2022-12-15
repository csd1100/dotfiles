#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=${INFO:-$(osascript -e 'get volume settings' | rg --pcre2 -o "(?<=output volume:)\w+")}
MUTED=$(osascript -e 'get volume settings' | rg --pcre2 -o "(?<=output muted:)\w+")

if [ $MUTED = "true" ]; then
	ACCENT=$R
	LABEL="Muted"
else
	case ${PERCENTAGE} in
	100)
		ACCENT=$G
		;;
	[8-9][0-9])
		ACCENT=$G
		;;
	[6-7][0-9])
		ACCENT=$Y
		;;
	[1-5][0-9])
		ACCENT=$O
		;;
	*)
		ACCENT=$R
		;;
	esac
	LABEL="$PERCENTAGE%"
fi

case $SENDER in
"mouse.entered")
	LABEL_DRAWING=on
	;;
*)
	LABEL_DRAWING=off
	;;
esac

sketchybar --set $NAME label.drawing=$LABEL_DRAWING \
	label=$LABEL
