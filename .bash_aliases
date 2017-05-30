#!/bin/bash

# Aliases

# Update
alias gimme='sudo sh -c "apt-get -y update; apt-get -y dist-upgrade; apt-get -y autoremove; apt-get -y autoclean"'

# TMUX interfaces
alias interdv='~/.scripts/interface-docker-vim.sh'

# Docker
alias dc='docker-compose'
alias dcr='docker-compose run'
alias dcu='docker-compose up'

# Display
alias disp-optik='xrandr --output eDP-1-1 --mode 1920x1080 --output HDMI-1-2 --mode 2560x1080 --right-of eDP-1-1 --output VGA-1-1 --mode 1920x1080 --right-of HDMI-1-2'
alias disp-home='xrandr --output eDP-1-1 --mode 1920x1080 --output HDMI-1-2 --mode 1920x1080 --right-of eDP-1-1'
alias disp-mirror='xrandr --output eDP-1-1 --mode 1920x1080 --output HDMI-1-2 --same-as eDP-1-1'

# Other
alias zo='zdg-open'
alias pia='/home/fabien/.pia_manager/pia_manager/run.sh > /dev/null 2>&1 &'
alias lock='gnome-screensaver-command -l'
alias resize-func='function _resize(){ convert "$1" -resize "$2" _res"$2"_"$1"; };_resize'

alias graphmatica='wine ~/.wine/dosdevices/c:/Program\ Files/Graphmatica/Graphmatica.exe'
