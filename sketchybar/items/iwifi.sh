#!/usr/bin/env bash

sketchybar --add item wifi right

sketchybar --subscribe wifi system_woke

sketchybar --set wifi \
	label.drawing=on \
	icon.drawing=on \
	script="$PLUGIN_DIR/pwifi.sh" \
	update_freq=1
