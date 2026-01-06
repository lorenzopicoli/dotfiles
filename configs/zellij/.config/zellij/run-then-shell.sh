#!/usr/bin/env bash
set -euo pipefail

echo "[run-then-shell] starting: $*"
echo

status=0
if [[ $# -gt 0 ]]; then
  "$@" || status=$?
fi

echo
echo "[run-then-shell] exited with status $status"
echo "[run-then-shell] dropping to shell"
echo



exec "${SHELL:-/bin/zsh}" -i