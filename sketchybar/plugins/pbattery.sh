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
	ACCENT=$G
	;;
[6-8][0-9])
	ACCENT=$G
	;;
[3-5][0-9])
	ACCENT=$Y
	;;
[1-2][0-9])
	ACCENT=$WARN
	;;
*)
	ACCENT=$R
	;;
esac

case $SENDER in
"mouse.entered")
	LABEL_DRAWING=on
	;;
*)
	LABEL_DRAWING=off
	;;
esac

sketchybar --set $NAME label.drawing=$LABEL_DRAWING \
	label="${PERCENTAGE}%"
