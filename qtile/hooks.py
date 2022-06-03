import os
import subprocess

from libqtile import hook
from libqtile.lazy import lazy
from pywal import image, wallpaper, colors

from vars import term

home = os.path.expanduser('~')
py_wall = image.get(home + '/Pictures/Wallpaper/Arts/')


@hook.subscribe.startup
def autostart():
    subprocess.Popen(home + '/.config/qtile/scripts/autostart.sh')
    wallpaper.change(py_wall)


@hook.subscribe.client_new
def dialogs(window):
    if (window.window.get_wm_type() == 'dialog'
            or window.window.get_wm_transient_for()):
        window.floating = True


@hook.subscribe.client_new
def grouper(window, windows={term: '1',
                             'google-chrome': '2',
                             'rhythmbox': '3',
                             'nautilus': '4',
                             'code': '5',
                             'jetbrains-idea-ce': '6',
                             'jetbrains-pycharm-ce': '6',
                             'emacs': 'emacs',
                             'brave-browser': '8', }):
    """
     This function relies on the contentious feature of default arguments
     where upon function definition if the argument is a mutable datatype,
     then you are able to mutate the data held within that object.
     Current usage:
     {window_name: group_name}
     or for grouping windows to different groups you will need to have a
     list under the window-key with the order that you're starting the
     apps in.
     See the 'runner()' function for an example of using this method.
     Here:
     {window_name: [group_name1, group_name2]}
     Window name can be found via window.window.get_wm_class()
     """

    windowtype = window.window.get_wm_class()[0]

    # if the window is in our map
    if windowtype in windows.keys():

        # opening terminal applications gives
        # the window title the same name, this
        # means that we need to treat these apps
        # differently

        if windowtype != 'urxvt':
            window.togroup(windows[windowtype])
            windows.pop(windowtype)

        # if it's not on our special list,
        # we send it to the group and pop
        # that entry out the map
    else:
        try:
            window.togroup(windows[windowtype][0])
            windows[windowtype].pop(0)
        except IndexError:
            pass
