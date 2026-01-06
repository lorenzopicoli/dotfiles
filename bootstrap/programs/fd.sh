#!/usr/bin/env bash

log "Setting up fd"

if command_exists fd || command_exists fdfind; then
  log "fd already installed"
  return
fi

case "$PKG_MANAGER" in
  apt)
    install_pkg fd-find
    ;;
  *)
    install_pkg fd
    ;;
esac
