#!/usr/bin/env bash


PROGRAM="python3"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  brew install python
elif [[ "$OS" == "arch" ]]; then
 sudo pacman -S --noconfirm $PROGRAM 
elif [[ "$OS" == "apt" ]]; then
  sudo  apt install -y python3
  sudo  apt install -y python3-venv
  sudo  apt install -y python3-pip
fi
