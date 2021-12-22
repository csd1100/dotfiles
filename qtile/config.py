from libqtile import layout

from groups import groups  # NOQA
from hooks import *  # NOQA
from keys import keys, mouse  # NOQA
from qcolors import *
from screens import screens  # NOQA

layouts = [
    layout.Max(),
    layout.xmonad.MonadTall(
        border_focus=background,
        border_width=10,
        margin=10,
        single_margin=10
    )
]

widget_defaults = {'font': 'Space Mono', 'fontsize': 20, 'padding': 3, 'foreground': get_formatted_hex(foreground),
                   'background': background}
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating()
auto_fullscreen = True
focus_on_window_activation = 'focus'

wmname = 'LG3D'
