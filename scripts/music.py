#! /usr/bin/python

import os
import sys
import gi
gi.require_version('Playerctl', '1.0')
from gi.repository import Playerctl, GLib
from subprocess import Popen

pid = str(os.getpid())
pidfile = "/tmp/musicd.pid"

if os.path.isfile(pidfile):
    print("{} already exists, exiting".format(pidfile))
    sys.exit()

with open(pidfile, 'w') as f:
    f.write(pid)

def on_track_change(player, e):
    Popen(['polybar-msg', 'hook', 'music', '1'])

try:
    player = Playerctl.Player()
    player.on('metadata', on_track_change)
    GLib.MainLoop().run()
finally:
    os.unlink(pidfile)
