#!/usr/bin/env bash

PROGRAM="Hack nerd font"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
 pacman -S --noconfirm ttf-hack-nerd
elif [[ "$OS" == "apt" ]]; then
 skip_program y $PROGRAM
fi
