#!/usr/bin/env bash

log "Setting up Yazi"
if command_exists yazi; then
  log "Yazi already installed"
  return
fi
case "$OS" in
  macos)
    install_pkg yazi
    install_pkg ffmpeg
    install_pkg sevenzip
    install_pkg jq
    install_pkg poppler
    install_pkg fd
    install_pkg zoxide
    install_pkg resvg
    install_pkg imagemagick
    ;;
  apt)
    # Try to use brew 
    install_pkg_brew yazi
    install_pkg_brew ffmpeg
    install_pkg_brew sevenzip
    install_pkg_brew jq
    install_pkg_brew poppler
    install_pkg_brew fd
    install_pkg_brew zoxide
    install_pkg_brew resvg
    install_pkg_brew imagemagick
    ;;
  arch)
    install_pkg yazi
    install_pkg ffmpeg
    install_pkg 7zip
    install_pkg jq
    install_pkg poppler
    install_pkg fd
    install_pkg zoxide
    install_pkg resvg
    install_pkg imagemagick
    ;;
esac
