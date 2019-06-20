# -*- coding: utf-8 -*-
"""
    lodgeit
    ~~~~~~~

    The lodgeit pastebin.

    :copyright: 2007 by Armin Ronacher.
    :license: BSD
"""

import subprocess

try:
    lodgeit_version = subprocess.check_output(['git', 'rev-parse', 'HEAD'])[:7]
except (OSError, FileNotFoundError):
    # OSError in python2, FileNotFoundError in python3
    lodgeit_version = ""
