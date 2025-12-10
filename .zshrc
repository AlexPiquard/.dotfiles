export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

export PATH="$PATH:$HOME/.local/bin"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -z $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  export SUDO_EDITOR='nvim'
fi

# Android development
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# jdtls lombok
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"

# brew
[[ ! -f /home/linuxbrew/.linuxbrew/bin/brew ]] || eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# mise
[[ ! -f /home/linuxbrew/.linuxbrew/bin/mise ]] || eval "$(/home/linuxbrew/.linuxbrew/bin/mise activate zsh)"

# direnv
eval "$(direnv export zsh)"

#starship
eval "$(starship init zsh)"

source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# oh my zsh
source $HOME/oh-my-zsh.zsh

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"
# bun bin
export PATH="$HOME/.bun/bin:$PATH"

# go
export PATH="$PATH:$HOME/go/bin"

# fix pkg path
export PKG_CONFIG_PATH="/usr/share/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig"

# 1password gitea plugin for tea cli
source $HOME/.config/op/plugins.sh

# lazygit theme
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/theme.yml"

# aliases
alias ll='ls -l'

# Ctrl+Delete: kill the word forward (default is Alt+d)
# Ctrl+Backspace is handled in alacritty.toml because this key is unknown here
bindkey '^[[3;5~' kill-word

# rust
if [[ -f $HOME/.cargo/env ]]; then
  . "$HOME/.cargo/env"
  export PATH="$HOME/.cargo/bin"
fi
