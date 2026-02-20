#!/usr/bin/env bash
GHOSTTY_DIR="$HOME/.config/ghostty/"

log "Setting up ghostty font size for OS"


if [[ "$OS" == "macos" ]]; then
  ln -sf "$GHOSTTY_DIR/macos" "$GHOSTTY_DIR/os_specific"
else
  ln -sf "$GHOSTTY_DIR/linux" "$GHOSTTY_DIR/os_specific"
fi
