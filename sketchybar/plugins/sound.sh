#!/usr/bin/env sh
CONFIG_DIR="$HOME/.config/sketchybar"
source "$CONFIG_DIR/colors.sh"

PERCENTAGE=$INFO
MUTED=$(osascript -e 'get volume settings' | rg --pcre2 -o "(?<=output muted:)\w+")

if [ $MUTED = "true" ]; then
	ICON=""
	ACCENT=$ALERT
	LABEL="Muted"
else
	case ${PERCENTAGE} in
	100)
		ICON=""
		;;
	[6-9][0-9])
		ICON=""
		;;
	[1-5][0-9])
		ICON=""
		;;
	*) ICON="" ;;
	esac
	ACCENT=$ACCENT1
	LABEL="$PERCENTAGE%"
fi

sketchybar --set $NAME icon="$ICON" icon.color=$ACCENT label=$LABEL
