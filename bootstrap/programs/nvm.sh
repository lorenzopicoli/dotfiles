#!/usr/bin/env bash

log "Setting up nvm"
if command_exists nvm; then
  log "nvm already installed"
  return
fi
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash