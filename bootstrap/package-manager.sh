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


