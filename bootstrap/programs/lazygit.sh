#!/usr/bin/env bash

log "Setting up lazygit"

if command_exists lazygit; then
  log "lazygit already installed"
else
  install_pkg lazygit
fi
