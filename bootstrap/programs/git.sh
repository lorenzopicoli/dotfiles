#!/usr/bin/env bash

log "Setting up git"

if command_exists git; then
  log "git already installed"
else
  install_pkg git
fi
