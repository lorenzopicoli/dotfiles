#!/usr/bin/env bash

if command_exists cargo; then
  log "cargo already installed"
else
  log "installing rust/cargo"
  curl https://sh.rustup.rs -sSf | sh -s -- -y

  # Make cargo available immediately (no shell reload)
  if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
  fi
fi

# Install cargo-binstall only if it's not available
if cargo binstall --help >/dev/null 2>&1; then
  log "cargo-binstall already installed"
else
  log "installing cargo-binstall"
  curl -L --proto '=https' --tlsv1.2 -sSf \
    https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh \
    | bash
fi