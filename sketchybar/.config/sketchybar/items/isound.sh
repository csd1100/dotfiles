#!/usr/bin/env bash

sketchybar --add alias "Control Centre,Sound" right
sketchybar --rename "Control Centre,Sound" sound

sketchybar --subscribe sound system_woke volume_change mouse.entered mouse.exited.global

sketchybar --set sound \
    alias.color=$FOREGROUND \
	label.drawing=on \
	script="$PLUGIN_DIR/psound.sh" \
	update_freq=5
