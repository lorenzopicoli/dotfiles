#!/usr/bin/env bash

PROGRAM="fd"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  brew install $PROGRAM
elif [[ "$OS" == "arch" ]]; then
 sudo pacman -S --noconfirm $PROGRAM 
elif [[ "$OS" == "apt" ]]; then
 sudo apt install -y fd-find
fi
