#!/usr/bin/env bash

PROGRAM="stow"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  brew install $PROGRAM
elif [[ "$OS" == "arch" ]]; then
 sudo pacman -S --noconfirm $PROGRAM 
elif [[ "$OS" == "apt" ]]; then
 sudo apt install -y $PROGRAM
fi
