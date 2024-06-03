#!/usr/bin/env bash
source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

status="$($HOME/bin/vpn-manager status)"

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
	label="$status" \
	background.border_color=$ACCENT
