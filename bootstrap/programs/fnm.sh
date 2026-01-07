#!/usr/bin/env bash

log "Setting up fnm"
if command_exists fnm; then
  log "fnm already installed"
  return
fi

cargo install fnm