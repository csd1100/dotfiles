#!/usr/bin/env bash

if [ -z "$INFO" ]; then
	LABEL=$(yabai -m query --spaces --space | jq -r ".index")
else
	LABEL="$(echo $INFO | jq '."display-1"')"
fi

sketchybar --set $NAME label=$LABEL
