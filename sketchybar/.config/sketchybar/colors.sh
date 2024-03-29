#!/usr/bin/env bash

if [ "$SKETCHYBAR_THEME" = "light" ]; then
    BACKGROUND=0xffFAFAFA #FAFAFA
    FOREGROUND=0xff1D1D1D #1D1D1D

    BACKGROUND1=0xffECEFF1            #ECEFF1
    BACKGROUND2=0xffE0E0E0            #E0E0E0
    BACKGROUND3=0xffEEEEEE            #EEEEEE
    BACKGROUND4=0xffF5F5F5            #F5F5F5
    BACKGROUND_TRANSPARENT=0xaa181C1F #181C1F

    V=0xff4527A0 #4527A0
    I=0xff37474F #37474F
    B=0xff0775A6 #0775a6
    G=0xff0A664F #0A664F
    Y=0xffF3B100 #F3B100
    O=0xffFF6F00 #FF6F00
    R=0xff5A021A #5A021A

    ACCENT=0xff00C853 #03F386
else
    BACKGROUND=0xff1D1D1D #1D1D1D
    FOREGROUND=0xffFFFFFF #FFFFFF

    BACKGROUND1=0xff262626            #262626
    BACKGROUND2=0xff404040            #404040
    BACKGROUND3=0xff181C1F            #181C1F
    BACKGROUND4=0xff282F34            #282F34
    BACKGROUND_TRANSPARENT=0xaa181C1F #181C1F

    V=0xff6200EA #6200EA
    I=0xff607D8B #607D8B
    B=0xff00E5FF #00E5FF
    G=0xff03F386 #03F386
    Y=0xffF3B100 #F3B100
    O=0xffFF6F00 #FF6F00
    R=0xffFB1E5C #FB1E5C

    ACCENT=0xff03F386 #03F386
fi
