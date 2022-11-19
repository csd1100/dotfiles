#!/usr/bin/env sh
CONFIG_DIR="$HOME/.config/sketchybar"
source "$CONFIG_DIR/colors.sh"

status="$($HOME/bin/vpn-manager status)"
if [ $status = "connected" ]; then
	ACCENT=$ACCENT1
else
	ACCENT=$ALERT
fi

sketchybar --set vpn icon.color=$ACCENT
