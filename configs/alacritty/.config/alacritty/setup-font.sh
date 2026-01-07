#!/usr/bin/env bash
ALACRITTY_DIR="$HOME/.config/alacritty"

log "Setting up alacritty font size for OS"


if [[ "$OS" == "macos" ]]; then
  ln -sf "$ALACRITTY_DIR/macos.toml" "$ALACRITTY_DIR/os_specific.toml"
else
  ln -sf "$ALACRITTY_DIR/linux.toml" "$ALACRITTY_DIR/os_specific.toml"
fi