#!/usr/bin/env bash

log "Setting up Firefox "

if [[ "$OS" == "macos" ]]; then
  log "Skipping Firefox on macOS"
  skip_program "Firefox"
  return
fi

case "$PKG_MANAGER" in
  apt)
    install_pkg firefox
    ;;
  yay)
    install_pkg firefox
    ;;
esac