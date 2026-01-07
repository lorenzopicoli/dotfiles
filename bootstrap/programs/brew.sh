#!/usr/bin/env bash

log "Setting up Homebrew"

if command_exists brew; then
  log "brew already installed"
  return
fi

case "$OS" in
  macos)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ;;
  apt)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ;;
  arch)
    log "No need for brew in arch"
    ;;
esac