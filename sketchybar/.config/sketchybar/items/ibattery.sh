#!/usr/bin/env bash

sketchybar --add alias "Control Centre,Battery" right
sketchybar --rename "Control Centre,Battery" battery

sketchybar --subscribe battery system_woke mouse.entered mouse.exited.global

sketchybar --set battery \
    alias.color=$FOREGROUND \
	label.drawing=on \
	script="$PLUGIN_DIR/pbattery.sh" \
	update_freq=5
