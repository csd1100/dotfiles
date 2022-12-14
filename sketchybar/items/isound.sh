#!/usr/bin/env bash

sketchybar --add item sound right

sketchybar --subscribe sound system_woke volume_change mouse.entered mouse.exited.global

sketchybar --set sound \
	label.drawing=on \
	icon.drawing=on \
	script="$PLUGIN_DIR/psound.sh" \
	update_freq=5
