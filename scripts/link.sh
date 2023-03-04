#!/bin/bash

rm -f $HOME/.aliases
rm -f $HOME/.bashrc
rm -f $HOME/.env
rm -f $HOME/.gitconfig
rm -f $HOME/.profile
rm -f $HOME/.tmux.conf
rm -f $HOME/.vimrc
rm -f $HOME/.zprofile
rm -f $HOME/.zshrc

rm -fr $HOME/.config/nvim

ln -s $HOME/.dotfiles/.aliases    $HOME/.aliases
ln -s $HOME/.dotfiles/.bashrc     $HOME/.bashrc
ln -s $HOME/.dotfiles/.env        $HOME/.env
ln -s $HOME/.dotfiles/.gitconfig  $HOME/.gitconfig
ln -s $HOME/.dotfiles/.profile    $HOME/.profile
ln -s $HOME/.dotfiles/.tmux.conf  $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.vimrc      $HOME/.vimrc
ln -s $HOME/.dotfiles/.zprofile   $HOME/.zprofile
ln -s $HOME/.dotfiles/.zshrc      $HOME/.zshrc

ln -s $HOME/.dotfiles/.config/nvim $HOME/.config/nvim
