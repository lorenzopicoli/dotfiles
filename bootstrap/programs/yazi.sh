#!/usr/bin/env bash

PROGRAM="yazi"
log "Setting up $PROGRAM"

if command_exists yazi; then
  log "Yazi already installed"
  return
fi

if [[ "$OS" == "macos" ]]; then
  brew install $PROGRAM
  brew install ffmpeg
  brew install sevenzip
  brew install jq
  brew install poppler
  brew install fd
  brew install zoxide
  brew install resvg
  brew install imagemagick
elif [[ "$OS" == "arch" ]]; then
  sudo pacman -S --noconfirm $PROGRAM
  sudo pacman -S --noconfirm ffmpeg
  sudo pacman -S --noconfirm 7zip
  sudo pacman -S --noconfirm jq
  sudo pacman -S --noconfirm poppler
  sudo pacman -S --noconfirm fd
  sudo pacman -S --noconfirm zoxide
  sudo pacman -S --noconfirm resvg
  sudo pacman -S --noconfirm imagemagick
elif [[ "$OS" == "apt" ]]; then
  sudo brew install $PROGRAM
  sudo brew install ffmpeg
  sudo brew install sevenzip
  sudo brew install jq
  sudo brew install poppler
  sudo brew install fd
  sudo brew install zoxide
  sudo brew install resvg
  sudo brew install imagemagick
fi
