#!/usr/bin/env bash

log "Setting up uv"

if command_exists uv; then
  log "uv already installed"
  return
fi

case "$PKG_MANAGER" in
  brew)
    brew install uv
    ;;
  yay)
    install_pkg uv
    ;;
  apt)
    log "Installing uv via official installer"
    curl -fsSL https://astral.sh/uv/install.sh | sh
    ;;
esac
