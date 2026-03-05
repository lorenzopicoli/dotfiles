if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  # exec uwsm start hyprlandz
  exec start-hyprland
fi

# Homebrew (only if brew exists)
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pipx path (only if directory exists)
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

# OrbStack (only if init file exists)
if [ -f "$HOME/.orbstack/shell/init.zsh" ]; then
  source "$HOME/.orbstack/shell/init.zsh"
fi
