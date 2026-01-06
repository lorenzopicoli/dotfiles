#!/usr/bin/env bash

ALACRITTY_CONFIG_DIR="$HOME/.config/alacritty"
THEMES_DIR="$ALACRITTY_CONFIG_DIR/themes"
THEMES_REPO="https://github.com/alacritty/alacritty-theme"

log "Setting up Alacritty themes"

mkdir -p "$ALACRITTY_CONFIG_DIR"

if [[ -d "$THEMES_DIR/.git" ]]; then
  log "Alacritty themes already cloned"
else
  log "Cloning Alacritty themes"
  git clone "$THEMES_REPO" "$THEMES_DIR"
fi