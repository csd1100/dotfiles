from libqtile.config import Group, Match

from vars import term, default_browser, default_text_editor

groups = [
    Group(name='1', label='', layout='monadtall', matches=[Match(wm_class=term)], persist=True, init=True,
          exclusive=True, spawn=term),
    Group(name='2', label='', layout='monadtall',
          matches=[Match(wm_class='google-chrome'), Match(title='Google Chrome')], persist=True, init=True,
          exclusive=True, spawn=default_browser),
    Group(name='3', label='',
          matches=[Match(wm_class='rhythmbox'), Match(wm_class='cmus'), Match(wm_class='spotify')], persist=False,
          init=True, exclusive=False,),
    Group(name='4', label='', matches=[Match(wm_class='nautilus'), Match(wm_class='ranger')],
          persist=True, init=True, exclusive=False),
    Group(name='5', label='', layout='monadtall', matches=[Match(wm_class='code')], persist=True, init=True,
          exclusive=True),
    Group(name='6', label='', layout='max',
          matches=[Match(wm_class='jetbrains-idea-ce'), Match(wm_class='jetbrains-pycharm-ce'),
                   Match(wm_class='jetbrains-toolbox-ce'), Match(wm_class='java-util-concurrent-ForkJoinWorkerThread')],
          persist=False, init=False, exclusive=True),
    Group(name='7', label='', layout='max', matches=[Match(wm_class='calibre-ebook-viewer'), Match(wm_class='calibre')],
          persist=False, init=False, exclusive=True),
    Group(name='8', label='爵', layout='monadtall', matches=[Match(wm_class='brave-browser')], persist=True, init=True,
          exclusive=True,),
    Group(name='9', label='聆 ', layout='monadtall',
          matches=[Match(wm_class='microsoft teams - preview'),
                   Match(wm_class='slack'), ],
          persist=False, init=False, exclusive=True),
]
