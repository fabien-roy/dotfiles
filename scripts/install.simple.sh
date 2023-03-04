#!/bin/bash

if [ "$(whoami)" != "root" ]; then 
  echo "You need to execute this script as sudo"
  exit 1
fi

apt-get install nvim
apt-get install zsh
apt-get install git

apt-get install tmux
apt-get install autojump

source ./link.sh

tmux
zsh

echo "Et voilà."
