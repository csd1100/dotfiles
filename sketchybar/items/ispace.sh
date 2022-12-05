#!/usr/bin/env bash
sketchybar --add item space_display left

sketchybar --subscribe space_display space_change

sketchybar --set space_display \
	label.drawing=on \
	label.color=$ACCENT1 \
	icon.drawing=off \
	script="$PLUGIN_DIR/pspace.sh"
