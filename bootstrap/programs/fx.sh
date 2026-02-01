#!/usr/bin/env bash

log "Setting up fx"

if command_exists fx; then
  log "fx already installed"
  return
fi

curl https://fx.wtf/install.sh | sh
