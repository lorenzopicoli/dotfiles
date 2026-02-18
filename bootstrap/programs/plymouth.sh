#!/usr/bin/env bash

PROGRAM="plymouth"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
  sudo pacman -S --noconfirm $PROGRAM 
  yay -S --needed --noconfirm plymouth-theme-arch-logo
elif [[ "$OS" == "apt" ]]; then
 skip_program $PROGRAM
fi
