#!/bin/bash

if [ "$(whoami)" != "root" ]; then 
  echo "You need to execute this script as sudo"
  exit 1
fi

apt-get install vim
apt-get install zsh
apt-get install git

apt-get install tmux
apt-get install autojump

source ./link.simple.sh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c 'PluginInstall' -c 'qa!'

tmux
zsh

echo "Et voilà."
