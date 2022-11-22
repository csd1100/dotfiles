#!/usr/bin/env sh
CONFIG_DIR="$HOME/.config/sketchybar"
source "$CONFIG_DIR/colors.sh"

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"

if [ "$SSID" = "" ]; then
	LABEL="Disconnected"
	ICON=
	ACCENT=$ALERT
else
	LABEL="$SSID"
	ICON=
	ACCENT=$ACCENT1
fi
sketchybar --set $NAME label="$LABEL" icon=$ICON icon.color=$ACCENT
