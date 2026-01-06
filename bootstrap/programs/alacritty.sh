#!/usr/bin/env bash

log "Setting up Alacritty"

if [[ "$OS" == "macos" ]]; then
  log "Skipping Alacritty on macOS"
  # See https://github.com/orgs/Homebrew/discussions/6482
  skip_program "Alacritty"
  return
fi

if command_exists alacritty; then
  log "Alacritty already installed"
  return
fi

install_pkg alacritty
source "$ROOT_DIR/configs/alacritty/.config/alacritty/setup-themes.sh"