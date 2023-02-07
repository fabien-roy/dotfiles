#!/bin/bash

if [ -f $HOME/.env ]; then
  source $HOME/.env
fi

if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
. "$HOME/.cargo/env"
