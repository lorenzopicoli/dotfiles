#!/usr/bin/env bash

SKIPPED_PROGRAMS=()

skip_program() {
  local name="$1"
  SKIPPED_PROGRAMS+=("$name")
}
