#!/usr/bin/env bash

log "Setting up bat"

if command_exists bat || command_exists batcat; then
  log "bat already installed"
  return
fi

install_pkg bat
