#!/usr/bin/env bash

log "Setting up zellij"

# -----------------------------
# Install zellij
# -----------------------------
if command_exists zellij; then
  log "zellij already installed"
else
  cargo binstall zellij
fi

# Necessary otherwise zellij can't run this when loading the layout
chmod +x ~/.config/zellij/run-then-shell.sh