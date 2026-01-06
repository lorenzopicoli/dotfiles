#!/usr/bin/env bash

log "Setting up zsh"

# -----------------------------
# Install zsh
# -----------------------------
if command_exists zsh; then
  log "zsh already installed"
else
  install_pkg zsh
fi

ZSH_PATH="$(command -v zsh)"

# -----------------------------
# Ensure zsh is a valid shell
# -----------------------------
if [[ "$OS" == "macos" ]]; then
  if ! grep -q "$ZSH_PATH" /etc/shells; then
    log "Adding zsh to /etc/shells"
    echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
  fi
fi

# -----------------------------
# Set zsh as default shell
# -----------------------------
if [[ "$SHELL" != "$ZSH_PATH" ]]; then
  log "Setting zsh as default shell"
  chsh -s "$ZSH_PATH"
else
  log "zsh already set as default shell"
fi

# -----------------------------
# Install oh-my-zsh
# -----------------------------
ZSH_DIR="${ZSH:-$HOME/.oh-my-zsh}"

if [[ -d "$ZSH_DIR" ]]; then
  log "oh-my-zsh already installed"
else
  log "Installing oh-my-zsh"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
