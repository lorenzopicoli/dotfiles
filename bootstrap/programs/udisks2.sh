#!/usr/bin/env bash

PROGRAM="udisks2"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
 sudo pacman -S --noconfirm $PROGRAM 
 sudo pacman -S --noconfirm udiskie
elif [[ "$OS" == "apt" ]]; then
 skip_program $PROGRAM
fi
