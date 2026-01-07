#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$ROOT_DIR/configs/"
TARGET_DIR="$HOME"


source "$ROOT_DIR/bootstrap/log.sh"

log "Applying dotfiles with stow"

if [[ ! -d "$DOTFILES_DIR" ]]; then
  log "No dotfiles directory found"
  exit 1
fi

cd "$DOTFILES_DIR"

for dir in */; do
  log "Stowing $dir"

  if ! output="$(stow --target="$TARGET_DIR" "$dir" 2>&1)"; then
    echo
    echo "ERROR: Failed to stow '$dir'"
    echo
    echo "$output"
    echo
    echo "You have conflicting configuration files in $TARGET_DIR."
    echo "Please back them up or remove them, then re-run bootstrap."
    echo
    exit 1
  fi
done