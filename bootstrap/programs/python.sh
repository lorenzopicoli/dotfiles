#!/usr/bin/env bash

log "Setting up Python 3"

if command_exists python3; then
  log "python3 already installed"
  return
fi

case "$PKG_MANAGER" in
  brew)
    brew install python
    ;;
  apt)
    install_pkg python3
    install_pkg python3-venv
    install_pkg python3-pip
    ;;
  yay)
    install_pkg python
    ;;
esac
