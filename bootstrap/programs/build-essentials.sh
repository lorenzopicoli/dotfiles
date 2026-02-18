#!/usr/bin/env bash


PROGRAM="base-devel/build-essential"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
 sudo pacman -S --noconfirm base-devel
elif [[ "$OS" == "apt" ]]; then
 sudo apt install -y build-essential
fi
