#!/usr/bin/env bash

log "Setting up Alacritty"

source "$ROOT_DIR/configs/alacritty/.config/alacritty/setup-themes.sh"
source "$ROOT_DIR/configs/alacritty/.config/alacritty/setup-font.sh"

if [[ "$OS" == "macos" ]]; then
  log "Skipping Alacritty on macOS"
  # See https://github.com/orgs/Homebrew/discussions/6482
  skip_program "Alacritty"
  return
fi

if command_exists alacritty; then
  log "Alacritty already installed"
else
  install_pkg alacritty
fi
