#!/usr/bin/env bash

PROGRAM="bat"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  log "Skipping Firefox on macOS"
  skip_program "Firefox"
elif [[ "$OS" == "arch" ]]; then
  sudo  pacman -S --noconfirm $PROGRAM 
elif [[ "$OS" == "apt" ]]; then
  sudo  apt install -y $PROGRAM
fi
