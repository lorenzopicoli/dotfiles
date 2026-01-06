if [[ "$OS" == "macos" ]]; then
  log "Skipping Raycast"
  skip_program "Raycast"
  return
fi