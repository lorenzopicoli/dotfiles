#!/usr/bin/env bash

PROGRAM="neovim"

if command_exists nvim; then
  log "nvim already installed"
  return
fi
log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
  yay -S --needed --noconfirm neovim-nightly-bin
elif [[ "$OS" == "apt" ]]; then
 skip_program $PROGRAM
fi
