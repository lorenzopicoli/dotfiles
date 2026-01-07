#!/usr/bin/env bash

log "Setting up build-essentials"

if command_exists uv; then
  log "build-essentials already installed"
  return
fi

case "$PKG_MANAGER" in
  yay)
    install_pkg base-devel
    ;;
  apt)
    install_pkg build-essential
    ;;
esac