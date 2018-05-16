#!/bin/bash

# Remove files to be linked
rm $HOME/.aliases
rm $HOME/.bashrc
rm $HOME/.env
rm $HOME/.gitconfig
rm $HOME/.profile
rm $HOME/.tmux.conf
rm $HOME/.vimrc
rm $HOME/.zprofile
rm $HOME/.zshrc

# Links 
ln -s $HOME/.dotfiles/.aliases.simple    $HOME/.aliases
ln -s $HOME/.dotfiles/.bashrc.simple     $HOME/.bashrc
ln -s $HOME/.dotfiles/.env               $HOME/.env
ln -s $HOME/.dotfiles/.gitconfig.simple  $HOME/.gitconfig
ln -s $HOME/.dotfiles/.profile           $HOME/.profile
ln -s $HOME/.dotfiles/.tmux.conf.simple  $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.vimrc.simple      $HOME/.vimrc
ln -s $HOME/.dotfiles/.zprofile          $HOME/.zprofile
