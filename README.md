# First install

- install alacritty or kitty
- install 1password
- zsh
    - install
    - `chsh -s $(which zsh)`
    - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" `
- install packages
    - using brew:
        - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
        - `brew install $(cat packages.txt)`
    - using pacman:
        - `sudo pacman -S - < packages.txt`
- install fonts (`Rec Mono Duotone` and `Symbols Nerd Font Mono`)
- symlink dotfiles: `stow .`
- tmux
    - install
    - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
    - `tmux source ~/.config/tmux/tmux.conf`
- auto theming: `sudo systemctl enable TerminalSystemTheme`

# Browsers

`./.config/<zen/firefox/helium>/install.sh`

(installed manually to get 1password integration)

# Rust

`curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh`

# TODO

- 1password integration with browsers not working because root owning is required for browser bin and parent folder 
