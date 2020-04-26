#!/bin/bash

if [ "$1" == "simple" ]; then
  sh $HOME/.dotfiles/scripts/install.simple.sh
  exit 1
fi

if [ "$(whoami)" != "root" ]; then 
  echo "You need to execute this script as sudo"
  exit 1
fi

apt-get install vim
apt-get install zsh
apt-get install git
apt-get install meld

apt-get install tmux
apt-get install autojump

apt-get install build-essential
apt-get install cmake

apt-get install python3-dev
apt-get install python3-pip

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

rm $HOME/.aliases
rm $HOME/.bashrc
rm $HOME/.gitconfig
rm $HOME/.profile
rm $HOME/.tmux.conf
rm $HOME/.vimrc
rm $HOME/.zprofile
rm $HOME/.zshrc

ln -s $HOME/.dotfiles/.vimrc      $HOME/.vimrc
ln -s $HOME/.dotfiles/.aliases    $HOME/.aliases
ln -s $HOME/.dotfiles/.bashrc     $HOME/.bashrc
ln -s $HOME/.dotfiles/.gitconfig  $HOME/.gitconfig
ln -s $HOME/.dotfiles/.profile    $HOME/.profile
ln -s $HOME/.dotfiles/.tmux.conf  $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.zprofile   $HOME/.zprofile
ln -s $HOME/.dotfiles/.zshrc      $HOME/.zshrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c 'PluginInstall' -c 'qa!'

sh $HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer

tmux
zsh

echo "Et voilà."
