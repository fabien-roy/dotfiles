#!/usr/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [ ! -d $ZSH/themes/geometry ]; then
  git clone https://github.com/jedahan/geometry $ZSH/themes/geometry 
fi

# Theme
ZSH_THEME="geometry/geometry"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Plugins
plugins=(bower, colorize, debian, docker-compose, docker, git, gulp, heroku, man, postgres. rails, rake, sudo, tmux)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER="hackerman"

# For Powerline
export TERM=xterm-256color

# Alias definitions.
if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi
