#!/bin/bash

export CONFIG=$HOME/.config
export PWD=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln -s $PWD/i3 $CONFIG/i3
ln -s $PWD/rofi $CONFIG/rofi
ln -s $PWD/polybar $CONFIG/polybar
ln -s $PWD/kitty $CONFIG/kitty
ln -s $PWD/neofetch $CONFIG/neofetch
ln -s $PWD/qtile $CONFIG/qtile
ln -s $PWD/ranger $CONFIG/ranger
ln -s $PWD/cmus $CONFIG/cmus

ln -s $PWD/.Xresources $HOME/.Xresources
ln -s $PWD/.xres $HOME/.xres


