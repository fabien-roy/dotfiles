#!/bin/bash

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -f "$HOME/.config/.Xresources" ];then
  xrdb -merge $HOME/.config/.Xresources
fi

# Java home
export JAVA_HOME="/usr/java/jre1.8.0_121"
PATH=${PATH}:"$JAVA_HOME/bin"

# Android home
export ANDROID_HOME="$HOME/android/Sdk"
PATH=${PATH}:"$ANDROID_HOME/tools":"$ANDROID_HOME/platform-tools"

# android studio is an asshole
export _JAVA_OPTIONS="-Xms256m -Xmx2048m"
