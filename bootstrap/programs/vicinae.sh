#!/usr/bin/env bash

PROGRAM="vicinae"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
  yay -S --needed --noconfirm  vicinae-bin
elif [[ "$OS" == "apt" ]]; then
 skip_program $PROGRAM
fi
