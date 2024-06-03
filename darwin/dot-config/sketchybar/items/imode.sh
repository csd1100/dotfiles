#!/usr/bin/env bash

sketchybar --add item color-changer center

sketchybar --set color-changer \
	script="$PLUGIN_DIR/pmode.sh"

sketchybar --add event yabai-mode
sketchybar --subscribe color-changer yabai-mode
