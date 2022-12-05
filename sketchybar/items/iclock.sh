#!/usr/bin/env bash
sketchybar --add item clock right

sketchybar --subscribe clock system_woke

sketchybar --set clock \
	label.drawing=on \
	icon.drawing=on \
	icon= \
	update_freq=10 \
	script="$PLUGIN_DIR/pclock.sh"
