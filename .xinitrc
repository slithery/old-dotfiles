#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap -layout gb
numlockx on
compton -b --config ~/.config/compton.conf
feh --bg-fill ~/.config/wallpapers/taxus.png
xrdb ~/.config/Xresources
exec herbstluftwm --locked
