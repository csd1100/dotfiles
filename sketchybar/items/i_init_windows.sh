#!/usr/bin/env bash
ids=$(yabai -m query --windows | jq -r ".[].id")

if [ "$ids" != "" ]; then
	while IFS= read -r window; do
		sketchybar --add item $window left
	done <<<"$ids"
fi
