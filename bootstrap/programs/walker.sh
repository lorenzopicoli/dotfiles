#!/usr/bin/env bash

PROGRAM="walker"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
 yay -S --needed --noconfirm walker
 yay -S --needed --noconfirm elephant-providerlist elephant-desktopapplications elephant-files elephant-runner elephant-calc elephant-clipboard
 elephant service enable
elif [[ "$OS" == "apt" ]]; then
 skip_program $PROGRAM
fi
