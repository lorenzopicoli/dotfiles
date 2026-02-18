#!/usr/bin/env bash

PROGRAM="zellij"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  cargo binstall zellij
elif [[ "$OS" == "arch" ]]; then
  sudo pacman -S --noconfirm $PROGRAM 
elif [[ "$OS" == "apt" ]]; then
  cargo binstall zellij
fi

# Necessary otherwise zellij can't run this when loading the layout
chmod +x ~/.config/zellij/run-then-shell.sh
