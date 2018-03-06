#!/bin/bash

# Check if user is root
if [ "$(whoami)" != "root" ]; then 
  echo "You need to execute this script as sudo"
  exit 1
fi

# Install everything
apt-get install vim
apt-get install zsh
apt-get install tmux
apt-get install git
apt-get install build-essential
apt-get install cmake
apt-get install autojump
apt-get install python-dev
apt-get install python3-dev

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

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

# Link files
ln -s $HOME/.dotfiles/.aliases    $HOME/.aliases
ln -s $HOME/.dotfiles/.bashrc     $HOME/.bashrc
ln -s $HOME/.dotfiles/.env        $HOME/.env
ln -s $HOME/.dotfiles/.gitconfig  $HOME/.gitconfig
ln -s $HOME/.dotfiles/.profile    $HOME/.profile
ln -s $HOME/.dotfiles/.tmux.conf  $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.vimrc      $HOME/.vimrc
ln -s $HOME/.dotfiles/.zprofile   $HOME/.zprofile
ln -s $HOME/.dotfiles/.zshrc      $HOME/.zshrc

# Installs Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Set up vim
vim -c 'PluginInstall' -c 'qa!'

# Set up YouCompleteMe.vim
sh $HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer
