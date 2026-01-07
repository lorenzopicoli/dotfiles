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
