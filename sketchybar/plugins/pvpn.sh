#!/usr/bin/env bash
source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

status="$($HOME/bin/vpn-manager status)"
if [ $status = "connected" ]; then
	ACCENT=$ACCENT1
	ICON="$VPN_CONNECTED"
	LABEL="CONN"
else
	ACCENT=$ALERT
	ICON="$VPN_DISCONNECTED"
	LABEL="DIS"
fi

sketchybar --set vpn icon=$ICON icon.color=$ACCENT label=$LABEL
