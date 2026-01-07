# -----------------------------
# Install oh-my-zsh plugins
# -----------------------------
ZSH_CUSTOM="${ZSH_DIR}/custom"

install_omz_plugin() {
  local name="$1"
  local repo="$2"

  if [[ -d "$ZSH_CUSTOM/plugins/$name" ]]; then
    log "oh-my-zsh plugin '$name' already installed"
  else
    log "Installing oh-my-zsh plugin '$name'"
    git clone --depth=1 "$repo" "$ZSH_CUSTOM/plugins/$name"
  fi
}

install_omz_plugin zsh-autosuggestions \
  https://github.com/zsh-users/zsh-autosuggestions

install_omz_plugin zsh-syntax-highlighting \
  https://github.com/zsh-users/zsh-syntax-highlighting
