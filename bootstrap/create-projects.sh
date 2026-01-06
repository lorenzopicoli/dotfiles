#!/usr/bin/env bash

PROJECTS_DIR="$HOME/projects"

log "Ensuring projects directory exists at $PROJECTS_DIR"

if [[ -d "$PROJECTS_DIR" ]]; then
  log "projects directory already exists"
else
  mkdir -p "$PROJECTS_DIR"
  log "Created $PROJECTS_DIR"
fi