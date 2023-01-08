import os
import subprocess
from time import time
from pathlib import Path
from libqtile.config import Click, Drag
from libqtile.config import Key
from libqtile.lazy import lazy

from vars import term, default_browser
from groups import groups

mod = 'mod4'
alt = 'mod1'
home = os.path.expanduser('~')


def screenshot(save=True, copy=True):
    def f():
        path = Path.home() / 'Pictures'
        path /= f'screenshot_{str(int(time() * 100))}.png'
        shot = subprocess.run(['maim'], stdout=subprocess.PIPE)

        if save:
            with open(path, 'wb') as sc:
                sc.write(shot.stdout)

        if copy:
            subprocess.run(['xclip', '-selection', 'clipboard', '-t',
                            'image/png'], input=shot.stdout)

    return f


def app_or_group(group, app):
    def f(qtile):
        if qtile.groupMap[group].windows:
            qtile.groupMap[group].cmd_toscreen()
        else:
            qtile.groupMap[group].cmd_toscreen()
            qtile.cmd_spawn(app)

    return f


keys = [
    Key([mod], 'Down', lazy.layout.down()),
    Key([mod], 'Up', lazy.layout.up()),
    Key([mod], 'space', lazy.layout.next()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),

    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),
    Key([mod, 'control'], 'Down', lazy.layout.shuffle_down()),
    Key([mod, 'control'], 'Up', lazy.layout.shuffle_up()),
    Key([mod, 'shift'], 'space', lazy.layout.rotate()),
    Key([mod, 'shift'], 'Return', lazy.layout.toggle_split()),

    Key([mod], 'Tab', lazy.next_layout()),
    Key([mod, 'shift'], 'q', lazy.window.kill()),
    Key([mod], 'r', lazy.spawncmd()),
    Key([mod], 'd', lazy.spawn(
        home + '/.config/rofi/scripts/run-rofi apps')),
    Key([mod, 'shift'], 'd', lazy.spawncmd()),

    Key([mod, 'shift'], 'r', lazy.restart()),
    Key([mod, 'shift'], 'e', lazy.shutdown()),
    Key([mod], 'x', lazy.spawn(
        home + '/.config/rofi/scripts/power-menu')),
    Key([mod], 'w', lazy.spawn(
        home + '/.config/rofi/scripts/run-rofi windows')),

    # Screen
    Key([], 'F7', lazy.spawn('xset dpms force off')),
    Key([], 'XF86MonBrightnessUp', lazy.spawn('light -A 10')),
    Key([], 'XF86MonBrightnessDown', lazy.spawn('light -U 10')),

    # Audio
    Key([], 'XF86AudioMute', lazy.spawn(
        'pactl set-sink-mute @DEFAULT_SINK@ toggle')),
    Key([], 'XF86AudioRaiseVolume', lazy.spawn(
        'pactl set-sink-volume @DEFAULT_SINK@ +10%')),
    Key([], 'XF86AudioLowerVolume', lazy.spawn(
        'pactl set-sink-volume @DEFAULT_SINK@ -10%')),
    Key([], 'XF86AudioPlay', lazy.spawn('playerctl play-pause')),
    Key([], 'XF86AudioNext', lazy.spawn('playerctl next')),
    Key([], 'XF86AudioPrev', lazy.spawn('playerctl previous')),

    # Apps
    Key([mod], 'Return', lazy.spawn(term)),
    Key([mod], 'b', lazy.spawn(default_browser)),
    Key([mod], 'm', lazy.function(app_or_group('3', 'rhythmbox'))),

    # Screenshots
    Key([], 'Print', lazy.function(screenshot())),
    Key(['control'], 'Print', lazy.spawn('deepin-screenshot'))
]

for i in groups:
    keys.append(Key([mod], i.name, lazy.group[i.name].toscreen(toggle=False)))
    keys.append(Key([mod, 'shift'], i.name,
                    lazy.window.togroup(i.name)))

mouse = [
    Drag([mod], "Button1", None),
    Drag([mod], "Button3", None),
    Click([mod], "Button2", None)
]
