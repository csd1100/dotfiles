#!/usr/bin/env bash
sketchybar --add item clock right

sketchybar --subscribe clock system_woke mouse.entered mouse.exited.global

sketchybar --set clock \
	label.drawing=on \
	update_freq=1 \
	script="$PLUGIN_DIR/pclock.sh"
