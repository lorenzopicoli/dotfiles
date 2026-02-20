#!/usr/bin/env bash

log "Setting up Ghostty"
if [[ "$OS" == "macos" ]]; then
  brew install --cask ghostty
elif [[ "$OS" == "arch" ]]; then
 sudo pacman -S --noconfirm ghostty
elif [[ "$OS" == "apt" ]]; then
 log "Skipping Ghostty until I'm sure how to install it on apt"
 skip_program "Ghostty"
fi

source "$ROOT_DIR/configs/ghostty/.config/ghostty/setup-font.sh"
