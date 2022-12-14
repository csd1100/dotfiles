#!/usr/bin/env sh
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
if [ "$SSID" = "" ]; then
	LABEL="Disconnected"
	ICON=$WIFI_DISCONNECTED
	ACCENT=$R
else
	LABEL="$SSID"
	ICON=$WIFI_CONNECTED
	ACCENT=$G
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
	label="$LABEL" \
	icon=$ICON \
	icon.color=$FOREGROUND \
	background.border_color=$ACCENT
