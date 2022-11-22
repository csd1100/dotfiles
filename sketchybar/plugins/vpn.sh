#!/usr/bin/env sh
CONFIG_DIR="$HOME/.config/sketchybar"
source "$CONFIG_DIR/colors.sh"

status="$($HOME/bin/vpn-manager status)"
if [ $status = "connected" ]; then
	ACCENT=$ACCENT1
	ICON=
	LABEL="CONN"
else
	ACCENT=$ALERT
	ICON=
	LABEL="DIS"
fi

sketchybar --set vpn icon=$ICON icon.color=$ACCENT label=$LABEL
