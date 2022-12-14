#!/usr/bin/env bash

sketchybar --add item battery right

sketchybar --subscribe battery system_woke mouse.entered mouse.exited.global

sketchybar --set battery \
	label.drawing=on \
	icon.drawing=on \
	script="$PLUGIN_DIR/pbattery.sh" \
	update_freq=5
