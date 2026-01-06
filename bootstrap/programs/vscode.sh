#!/usr/bin/env bash

log "Setting up Visual Studio Code"

if [[ "$OS" == "macos" ]]; then
  log "Skipping VS Code on macOS (remember to setup code CLI)"
  skip_program "Visual Studio Code"
  return
fi

if command_exists code; then
  log "VS Code already installed"
  return
fi

case "$PKG_MANAGER" in
  apt)
    install_pkg code
    ;;
  yay)
    install_pkg visual-studio-code-bin
    ;;
esac
