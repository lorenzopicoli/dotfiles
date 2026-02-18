#!/usr/bin/env bash


PROGRAM="vscode"

log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
 yay -S --needed --noconfirm visual-studio-code-bin
elif [[ "$OS" == "apt" ]]; then
 skip_program $PROGRAM
fi
