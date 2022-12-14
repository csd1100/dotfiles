#!/usr/bin/env bash

sketchybar --add item wifi right

sketchybar --subscribe wifi system_woke mouse.entered mouse.exited.global

sketchybar --set wifi \
	label.drawing=on \
	icon.drawing=on \
	script="$PLUGIN_DIR/pwifi.sh" \
	update_freq=5
