#!/usr/bin/env bash

PROGRAM="fzf"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  brew install fzf
elif [[ "$OS" == "arch" ]]; then
 sudo pacman -S --noconfirm fzf
elif [[ "$OS" == "apt" ]]; then
 sudo apt install -y fzf
fi
