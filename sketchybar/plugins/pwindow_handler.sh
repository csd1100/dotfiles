#!/usr/bin/env bash

if [ $SENDER = "window_added" ]; then
	sketchybar --add item $ID left
elif [ $SENDER = "window_destroyed" ]; then
	sketchybar --remove $ID
fi
