#!/usr/bin/env bash

PROGRAM="curl"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program 'curl'
elif [[ "$OS" == "arch" ]]; then
 sudo pacman -S --noconfirm $PROGRAM 
elif [[ "$OS" == "apt" ]]; then
 apt install -y $PROGRAM
fi
