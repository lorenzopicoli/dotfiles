#!/usr/bin/env bash

log "Setting up Curl"

if [[ "$OS" == "macos" ]]; then
  return
fi

install_pkg curl 