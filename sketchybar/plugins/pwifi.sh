#!/usr/bin/env sh
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"

if [ "$SSID" = "" ]; then
	LABEL="Disconnected"
	ICON=$WIFI_DISCONNECTED
	ACCENT=$ALERT
else
	LABEL="$SSID"
	ICON=$WIFI_CONNECTED
	ACCENT=$ACCENT1
fi
sketchybar --set $NAME label="$LABEL" icon=$ICON icon.color=$ACCENT
