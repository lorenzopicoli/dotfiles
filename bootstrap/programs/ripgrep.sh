#!/usr/bin/env bash

log "Setting up ripgrep"

if command_exists rg; then
  log "ripgrep already installed"
  return
fi

install_pkg ripgrep
