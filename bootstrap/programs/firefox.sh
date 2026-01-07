#!/usr/bin/env bash

log "Setting up Firefox "

if [[ "$OS" == "macos" ]]; then
  log "Skipping Firefox on macOS"
  skip_program "Firefox"
  return
fi

install_pkg firefox