#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"

if [ -z "$INFO" ]; then
	LABEL=$(yabai -m query --windows --window | jq -r ".app")
else
	LABEL=$INFO
fi

sketchybar --set $NAME label="$LABEL"
