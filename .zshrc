#!/usr/bin/zsh

source $HOME/.bashrc

export ZSH=$HOME/.oh-my-zsh

if [ ! -d $ZSH/plugins/zsh-z ]; then
  git clone https://github.com/agkozak/zsh-z $ZSH/plugins/zsh-z
fi

plugins=(git github gitignore zsh-z docker-compose docker-machine heroku tmux ubuntu vi-mode vim-interaction vundle common-aliases history)

if [ ! -d $ZSH/themes/geometry ]; then
  git clone https://github.com/geometry-zsh/geometry $ZSH/themes/geometry 
fi

ZSH_THEME="geometry/geometry"
GEOMETRY_PROMPT_PLUGINS=(docker_machine git)
PROMPT_GEOMETRY_EXEC_TIME=true

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

source $ZSH/oh-my-zsh.sh

DEFAULT_USER="hackerman"

export TERM=xterm-256color
