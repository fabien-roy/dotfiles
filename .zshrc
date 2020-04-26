#!/usr/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [ ! -d $ZSH/themes/geometry ]; then
  git clone https://github.com/geometry-zsh/geometry $ZSH/themes/geometry 
fi

# Theme
ZSH_THEME="geometry/geometry"

# Theme config
GEOMETRY_PROMPT_PLUGINS=(docker_machine git)
PROMPT_GEOMETRY_EXEC_TIME=true

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

source $ZSH/oh-my-zsh.sh

DEFAULT_USER="hackerman"

# For Powerline
export TERM=xterm-256color

# TMUX
if [ "$TMUX" = "" ]; then 
  tmux; 
fi
