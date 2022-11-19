#!/usr/bin/env sh

sketchybar --animate tanh 20 --set $NAME label="$(echo $INFO | jq '."display-1"')"
