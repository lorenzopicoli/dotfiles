#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$ROOT_DIR/bootstrap/log.sh"
source "$ROOT_DIR/bootstrap/package-manager.sh"
source "$ROOT_DIR/bootstrap/skipped.sh"

detect_os
log "Detected OS: $OS"

# Programs
source "$ROOT_DIR/bootstrap/programs/stow.sh"
source "$ROOT_DIR/stow.sh"

source "$ROOT_DIR/bootstrap/create-projects.sh"

source "$ROOT_DIR/bootstrap/programs/curl.sh"
source "$ROOT_DIR/bootstrap/programs/build-essentials.sh"
source "$ROOT_DIR/bootstrap/programs/zsh.sh"
source "$ROOT_DIR/bootstrap/programs/git.sh"
source "$ROOT_DIR/bootstrap/programs/brew.sh"
source "$ROOT_DIR/bootstrap/programs/rust.sh"
source "$ROOT_DIR/bootstrap/programs/zellij.sh"
source "$ROOT_DIR/bootstrap/programs/lazygit.sh"
source "$ROOT_DIR/bootstrap/programs/vscode.sh"
source "$ROOT_DIR/bootstrap/programs/docker.sh"
source "$ROOT_DIR/bootstrap/programs/ghostty.sh"
source "$ROOT_DIR/bootstrap/programs/fnm.sh"
source "$ROOT_DIR/bootstrap/programs/thunderbird.sh"
source "$ROOT_DIR/bootstrap/programs/wireguard.sh"
source "$ROOT_DIR/bootstrap/programs/python.sh"
source "$ROOT_DIR/bootstrap/programs/uv.sh"
source "$ROOT_DIR/bootstrap/programs/firefox.sh"
source "$ROOT_DIR/bootstrap/programs/ripgrep.sh"
source "$ROOT_DIR/bootstrap/programs/fd.sh"
source "$ROOT_DIR/bootstrap/programs/bat.sh"
source "$ROOT_DIR/bootstrap/programs/fzf.sh"
source "$ROOT_DIR/bootstrap/programs/fx.sh"
source "$ROOT_DIR/bootstrap/programs/oh-my-zsh-plugins.sh"
source "$ROOT_DIR/bootstrap/programs/yazi.sh"
source "$ROOT_DIR/bootstrap/programs/man.sh"
source "$ROOT_DIR/bootstrap/programs/wiremix.sh"
source "$ROOT_DIR/bootstrap/programs/waybar.sh"
source "$ROOT_DIR/bootstrap/programs/telegram.sh"
source "$ROOT_DIR/bootstrap/programs/fuse2.sh"
source "$ROOT_DIR/bootstrap/programs/plymouth.sh"
source "$ROOT_DIR/bootstrap/programs/wl-clipboard.sh"
source "$ROOT_DIR/bootstrap/programs/neovim.sh"
source "$ROOT_DIR/bootstrap/programs/swaybg.sh"
source "$ROOT_DIR/bootstrap/programs/hyprshot.sh"
source "$ROOT_DIR/bootstrap/programs/bitwarden.sh"
source "$ROOT_DIR/bootstrap/programs/postgres.sh"
source "$ROOT_DIR/bootstrap/programs/udisks2.sh"
# source "$ROOT_DIR/bootstrap/programs/walker.sh"
source "$ROOT_DIR/bootstrap/programs/vicinae.sh"
source "$ROOT_DIR/bootstrap/programs/hyprsunset.sh"

# Apply stow once again to make sure all configs are applied (I'm wondering if any installed program might've overwritten the symlinks?)
source "$ROOT_DIR/stow.sh"

log "==================================================================="
log "Bootstrap complete"
log "==================================================================="
if [[ "$OS" == "macos" && "${#SKIPPED_PROGRAMS[@]}" -gt 0 ]]; then
  log "==================================================================="
  log "The following programs were skipped:"
  log "==================================================================="
  for prog in "${SKIPPED_PROGRAMS[@]}"; do
    echo "  - $prog"
  done
fi

log "You should restart your terminal to see all the changes"
