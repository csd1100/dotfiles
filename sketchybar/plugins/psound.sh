#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=${INFO:-$(osascript -e 'get volume settings' | rg --pcre2 -o "(?<=output volume:)\w+")}
MUTED=$(osascript -e 'get volume settings' | rg --pcre2 -o "(?<=output muted:)\w+")

if [ $MUTED = "true" ]; then
	ICON=$VOLUME_MUTE
	ACCENT=$R
	LABEL="Muted"
else
	case ${PERCENTAGE} in
	100)
		ICON=$VOLUME_HIGH
		ACCENT=$G
		;;
	[8-9][0-9])
		ICON=$VOLUME_HIGH
		ACCENT=$G
		;;
	[6-7][0-9])
		ICON=$VOLUME_MEDIUM
		ACCENT=$Y
		;;
	[1-5][0-9])
		ICON=$VOLUME_LOW
		ACCENT=$O
		;;
	*)
		ICON=$VOLUME_LOW
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

sketchybar --set $NAME icon="$ICON" \
	icon.color=$FOREGROUND \
	label.drawing=$LABEL_DRAWING \
	background.border_color=$ACCENT \
	label=$LABEL
