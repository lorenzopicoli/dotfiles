#!/usr/bin/env bash

log "Setting up fzf"

if command_exists fzf; then
  log "fzf already installed"
  return
fi

install_pkg fzf
