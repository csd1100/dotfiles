#!/usr/bin/env bash
source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

status="$($HOME/bin/vpn-manager status)"
if [ $status = "connected" ]; then
	ACCENT=$G
	ICON="$VPN_CONNECTED"
	LABEL="CONN"
else
	ACCENT=$R
	ICON="$VPN_DISCONNECTED"
	LABEL="DIS"
fi

case $SENDER in
"mouse.entered")
	LABEL_DRAWING=on
	;;
*)
	LABEL_DRAWING=off
	;;
esac

sketchybar --set vpn icon=$ICON \
	icon.color=$FOREGROUND \
	label.drawing=$LABEL_DRAWING \
	label=$LABEL \
	background.border_color=$ACCENT
