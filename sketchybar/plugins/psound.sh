#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=${INFO:-$(osascript -e 'get volume settings' | rg --pcre2 -o "(?<=output volume:)\w+")}
MUTED=$(osascript -e 'get volume settings' | rg --pcre2 -o "(?<=output muted:)\w+")

if [ $MUTED = "true" ]; then
	ICON=$VOLUME_MUTE
	ACCENT=$ALERT
	LABEL="Muted"
else
	case ${PERCENTAGE} in
	100)
		ICON=$VOLUME_HIGH
		ACCENT=$ACCENT1
		;;
	[8-9][0-9])
		ICON=$VOLUME_HIGH
		ACCENT=$ACCENT1
		;;
	[6-7][0-9])
		ICON=$VOLUME_MEDIUM
		ACCENT=$ACCENT1
		;;
	[1-5][0-9])
		ICON=$VOLUME_LOW
		ACCENT=$WARN
		;;
	*)
		ICON=$VOLUME_LOW
		ACCENT=$ALERT
		;;
	esac
	LABEL="$PERCENTAGE%"
fi

sketchybar --set $NAME icon="$ICON" icon.color=$ACCENT label=$LABEL
