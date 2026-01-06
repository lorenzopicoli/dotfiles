#!/usr/bin/env bash

log "Setting up GNU Stow"

if command_exists stow; then
  log "gnu stow already installed"
else
  install_pkg stow
fi
