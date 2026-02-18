#!/usr/bin/env bash


if command_exists uv; then
  log "uv already installed"
  return
fi

PROGRAM="uv"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  brew install $PROGRAM
elif [[ "$OS" == "arch" ]]; then
  sudo pacman -S --noconfirm $PROGRAM 
elif [[ "$OS" == "apt" ]]; then
 log "Installing uv via official installer" 
 curl -fsSL https://astral.sh/uv/install.sh | sh
fi

