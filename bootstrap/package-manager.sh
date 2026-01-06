#!/usr/bin/env bash

command_exists() {
  command -v "$1" >/dev/null 2>&1
}


detect_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
    PKG_MANAGER="brew"
    return
  fi

  if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    case "$ID" in
      pop|ubuntu|debian)
        OS="apt"
        PKG_MANAGER="apt"
        ;;
      arch)
        OS="arch"
        PKG_MANAGER="yay"
        ;;
      *)
        echo "Unsupported Linux distribution: $ID"
        exit 1
        ;;
    esac
    return
  fi

  echo "Unsupported operating system"
  exit 1
}


ensure_pkg_manager() {
  case "$PKG_MANAGER" in
    brew)
      if ! command_exists brew; then
        log "Installing Homebrew"
        NONINTERACTIVE=1 /bin/bash -c \
          "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      fi
      ;;
    yay)
      if ! command_exists yay; then
        log "Installing yay"
        sudo pacman -Sy --needed --noconfirm git base-devel
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        (cd /tmp/yay && makepkg -si --noconfirm)
        rm -rf /tmp/yay
      fi
      ;;
  esac
}

install_pkg() {
  local pkg="$1"

  case "$PKG_MANAGER" in
    brew)
      brew list "$pkg" >/dev/null 2>&1 || brew install "$pkg"
      ;;
    apt)
      dpkg -s "$pkg" >/dev/null 2>&1 || sudo apt install -y "$pkg"
      ;;
    yay)
      yay -Q "$pkg" >/dev/null 2>&1 || yay -S --needed --noconfirm "$pkg"
      ;;
  esac
}
