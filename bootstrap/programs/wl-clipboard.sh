#!/usr/bin/env bash

PROGRAM="wl-clipboard"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
 sudo pacman -S --noconfirm $PROGRAM 
elif [[ "$OS" == "apt" ]]; then
 skip_program $PROGRAM
fi
