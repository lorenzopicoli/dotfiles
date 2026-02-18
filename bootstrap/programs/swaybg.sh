#!/usr/bin/env bash

PROGRAM="swaybg"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
  yay -S --needed --noconfirm $PROGRAM
elif [[ "$OS" == "apt" ]]; then
 skip_program $PROGRAM
fi
