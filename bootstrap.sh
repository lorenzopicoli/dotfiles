#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$ROOT_DIR/bootstrap/log.sh"
source "$ROOT_DIR/bootstrap/package-manager.sh"
source "$ROOT_DIR/bootstrap/skipped.sh"

detect_os
log "Detected OS: $OS"

ensure_pkg_manager

# Programs
source "$ROOT_DIR/bootstrap/programs/stow.sh"
source "$ROOT_DIR/bootstrap/stow-apply.sh"

source "$ROOT_DIR/bootstrap/create-projects.sh"

source "$ROOT_DIR/bootstrap/programs/curl.sh"
source "$ROOT_DIR/bootstrap/programs/build-essentials.sh"
source "$ROOT_DIR/bootstrap/programs/zsh.sh"
source "$ROOT_DIR/bootstrap/programs/git.sh"
source "$ROOT_DIR/bootstrap/programs/rust.sh"
source "$ROOT_DIR/bootstrap/programs/zellij.sh"
source "$ROOT_DIR/bootstrap/programs/lazygit.sh"
source "$ROOT_DIR/bootstrap/programs/vscode.sh"
source "$ROOT_DIR/bootstrap/programs/docker.sh"
source "$ROOT_DIR/bootstrap/programs/alacritty.sh"
source "$ROOT_DIR/bootstrap/programs/nvm.sh"
source "$ROOT_DIR/bootstrap/programs/thunderbird.sh"
source "$ROOT_DIR/bootstrap/programs/wireguard.sh"
source "$ROOT_DIR/bootstrap/programs/python.sh"
source "$ROOT_DIR/bootstrap/programs/uv.sh"
source "$ROOT_DIR/bootstrap/programs/firefox.sh"
source "$ROOT_DIR/bootstrap/programs/ripgrep.sh"
source "$ROOT_DIR/bootstrap/programs/fd.sh"
source "$ROOT_DIR/bootstrap/programs/bat.sh"
source "$ROOT_DIR/bootstrap/programs/fzf.sh"
source "$ROOT_DIR/bootstrap/programs/oh-my-zsh-plugins.sh"

# Apply stow once again to make sure all configs are applied (I'm wondering if any installed program might've overwritten the symlinks?)
source "$ROOT_DIR/bootstrap/stow-apply.sh"

if [[ "$OS" == "macos" && "${#SKIPPED_PROGRAMS[@]}" -gt 0 ]]; then
  echo
  echo "The following programs were skipped:"
  for prog in "${SKIPPED_PROGRAMS[@]}"; do
    echo "  - $prog"
  done
fi

log "Bootstrap complete"
echo "Run the following to apply changes:"
echo "  source ~/.zshrc"
