#!/bin/bash
xprop -id $(xdotool getactivewindow) | grep 'WM_NAME(STRING)' | cut -d'"' -f2
