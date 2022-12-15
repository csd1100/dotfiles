#!/usr/bin/env bash

sketchybar --add alias "Control Centre,WiFi" right
sketchybar --rename "Control Centre,WiFi" wifi

sketchybar --subscribe wifi system_woke mouse.entered mouse.exited.global

sketchybar --set wifi \
	label.drawing=on \
	script="$PLUGIN_DIR/pwifi.sh" \
	update_freq=5
