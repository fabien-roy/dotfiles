#!/bin/bash

if [ "$1" == "simple" ]; then
  sh $HOME/.dotfiles/scripts/install.simple.sh
  exit 1
fi

rm $HOME/.aliases
rm $HOME/.bashrc
rm $HOME/.env
rm $HOME/.gitconfig
rm $HOME/.profile
rm $HOME/.tmux.conf
rm $HOME/.vimrc
rm $HOME/.zprofile
rm $HOME/.zshrc

ln -s $HOME/.dotfiles/.aliases    $HOME/.aliases
ln -s $HOME/.dotfiles/.bashrc     $HOME/.bashrc
ln -s $HOME/.dotfiles/.env        $HOME/.env
ln -s $HOME/.dotfiles/.gitconfig  $HOME/.gitconfig
ln -s $HOME/.dotfiles/.profile    $HOME/.profile
ln -s $HOME/.dotfiles/.tmux.conf  $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.vimrc      $HOME/.vimrc
ln -s $HOME/.dotfiles/.zprofile   $HOME/.zprofile
ln -s $HOME/.dotfiles/.zshrc      $HOME/.zshrc
