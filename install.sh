#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if program name is provided
if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <program-name>"
  echo "Example: $0 alacritty"
  exit 1
fi

PROGRAM_NAME="$1"
PROGRAM_SCRIPT="$ROOT_DIR/bootstrap/programs/${PROGRAM_NAME}.sh"

# Check if program script exists
if [[ ! -f "$PROGRAM_SCRIPT" ]]; then
  echo "Error: Program script not found: $PROGRAM_SCRIPT"
  exit 1
fi

# Source necessary bootstrap files
source "$ROOT_DIR/bootstrap/log.sh"
source "$ROOT_DIR/bootstrap/package-manager.sh"
source "$ROOT_DIR/bootstrap/skipped.sh"

# Detect OS and ensure package manager
detect_os
log "Detected OS: $OS"
ensure_pkg_manager

# Source the program script
log "Installing $PROGRAM_NAME"
source "$PROGRAM_SCRIPT"

log "Installation of $PROGRAM_NAME complete"
