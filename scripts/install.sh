#!/bin/bash

if [ "$(whoami)" != "root" ]; then 
  echo "You need to execute this script as sudo"
  exit 1
fi

apt-get install nvim
apt-get install zsh
apt-get install git
apt-get install meld

apt-get install tmux
apt-get install autojump

apt-get install node

# pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Packer (nvim)
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

source ./link.sh

tmux
zsh

echo "Et voilà."
