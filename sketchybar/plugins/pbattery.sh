#!/usr/bin/env sh
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
	exit 0
fi

case ${PERCENTAGE} in
9[0-9] | 100)
	ICON=$BATTERY_FULL
	ACCENT=$G
	;;
[6-8][0-9])
	ICON=$BATTERY_HIGH
	ACCENT=$G
	;;
[3-5][0-9])
	ICON=$BATTERY_HALF
	ACCENT=$Y
	;;
[1-2][0-9])
	ICON=$BATTERY_LOW
	ACCENT=$WARN
	;;
*)
	ICON=""
	ACCENT=$R
	;;
esac

if [[ $CHARGING != "" ]]; then
	ICON=""
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
	label="${PERCENTAGE}%" \
	background.border_color=$ACCENT
