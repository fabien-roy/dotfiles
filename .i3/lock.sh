#!/bin/bash
# Thanks to /u/xrmb123 from https://www.reddit.com/r/unixporn/comments/5m15wj/gnome_pixellated_lock_screen/
scrot /home/$(whoami)/screen.png
convert /home/$(whoami)/screen.png -scale 10% -scale 1000% /home/$(whoami)/screen.png
[[ -f $1 ]] && convert /home/$(whoami)/screen.png $1 -gravity center -composite -matte /home/$(whoami)/screen.png
sleep 1
xscreensaver-command -l
