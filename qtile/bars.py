from libqtile import bar, widget

from qcolors import *

special_fonts = {'font': 'Space Mono for Powerline', 'fontsize': 35}
gap = widget.Sep(linewidth=0, padding=10)
bar_commons = {'size': 40,
               'foreground': get_formatted_hex(foreground),
               'background': get_formatted_hex(background),
               }
top_bar = bar.Bar(
    widgets=[
        gap,
        widget.TextBox(text='', **special_fonts),
        widget.Spacer(length=bar.STRETCH),
        widget.PulseVolume(fmt=' {}'),
        gap,
        widget.Battery(foreground=get_formatted_hex(foreground), low_percentage=0.20,
                       low_foreground=get_formatted_hex(color1), update_delay=10,
                       format=' {percent:.0%}'),
        widget.Clock(timezone='Asia/Kolkata', format='%B %-d, %H:%M'),
        widget.Systray(padding=10),
        gap,
    ],
    **bar_commons
)

bottom_bar = bar.Bar(
    [
        gap,
        widget.GroupBox(
            **special_fonts,
            highlight_method='text',
            active=get_formatted_hex(color8),
            this_current_screen_border=get_formatted_hex(foreground),
            urgent_alert_method='text',
            urgent_text=get_formatted_hex(color1),
        ),
        widget.Prompt(prompt='{prompt}: > '),
        widget.Spacer(length=bar.STRETCH),
        widget.Cmus(
            play_color=get_formatted_hex(color2),
            max_chars=40,
        ),
        widget.QuickExit(),
    ],
    **bar_commons
)
