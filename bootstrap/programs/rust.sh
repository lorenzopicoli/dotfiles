#!/usr/bin/env bash

if command_exists cargo; then
  log "rust/cargo already installed"
  return
fi
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Make cargo available *now*, without shell reload
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi