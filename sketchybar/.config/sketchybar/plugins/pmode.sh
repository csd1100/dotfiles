#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"

case $MODE in
"brightness")
	COLOR=$Y
	;;
"volume")
	COLOR=$V
	;;
"music")
	COLOR=$B
	;;
"space")
	COLOR=$R
	;;
"restart")
	COLOR=$G
	;;
"default")
	COLOR=$BACKGROUND
	;;
*)
	COLOR=$BACKGROUND
	;;
esac

sketchybar --bar color=$COLOR
