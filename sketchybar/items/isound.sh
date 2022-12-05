#!/usr/bin/env bash

sketchybar --add item sound right

sketchybar --subscribe sound system_woke volume_change

sketchybar --set sound \
	label.drawing=on \
	icon.drawing=on \
	script="$PLUGIN_DIR/psound.sh"
