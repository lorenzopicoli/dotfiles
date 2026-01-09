# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
setopt EXTENDED_HISTORY

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

plugins=(
  git
  fzf-tab
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

# For macOS. Useful for Lazygit and maybe others
# https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md
export XDG_CONFIG_HOME="$HOME/.config"

# Postgres/psql on macOS
if [[ -d "/Applications/Postgres.app/Contents/Versions/latest/bin" ]]; then
  export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
fi

# Java home for android dev on macOS
if [[ -d "/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home" ]]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
fi
if [[ -d "/usr/lib/jvm/java-17-openjdk-amd64" ]]; then
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
fi
if [[ -d "/home/linuxbrew/.linuxbrew/bin" ]]; then
  export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
fi

# For pipx on macOS
if [[ -d "/Users/lorenzo/.local/bin" ]]; then
  export PATH="$PATH:/Users/lorenzo/.local/bin"
fi
export PATH="$PATH:/Users/lorenzo/.cargo/bin"

# fzf shell integration
source <(fzf --zsh)

# Aliases
command -v batcat >/dev/null && alias bat=batcat
alias cat=bat
# alias l-lomnia="zellij --layout ~/.config/zellij/lomnia-layout.kdl"
# alias l-bc="zellij --layout ~/.config/zellij/bc-entry-layout.kdl"
alias sz="source ~/.zshrc"

export PATH=$PATH:/usr/local/go/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools


if [[ -f "$HOME/.zshrc.work" ]]; then
  source "$HOME/.zshrc.work"
fi

# The original "normal way" is:
# eval "$(fnm env --use-on-cd --shell zsh)"
# But the following adds timestamps when searching for history and automatically strips them
# when "pasting" the selection https://github.com/junegunn/fzf/issues/1049
eval "$(fzf --zsh| sed -e '/zmodload/s/perl/perl_off/' -e '/selected/s/fc -rl/fc -rlt "%F %T"/')"