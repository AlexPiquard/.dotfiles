# First install

- `sudo apt install alacritty`
- 1password
- zsh
    - `sudo apt install zsh`
    - `chsh -s $(which zsh)`
    - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" `
- brew
    - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
    - `brew install $(cat brew-packages.txt)`
- install fonts (`Rec Mono Duotone` and `Symbols Nerd Font Mono`)
- symlink dotfiles: `stow .`
- tmux
    - `sudo apt install tmux`
    - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
    - `tmux source ~/.config/tmux/tmux.conf`
- auto theming: `sudo systemctl enable AlacrittyAutoTheme`

# Browsers

`./.config/<zen/firefox/helium>/install.sh`

(installed manually to get 1password integration)

# Rust

`curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh`

# TODO

- use a terminal supporting images, and use snacks.image (kitty or ghostty)
- 1password integration with browsers not working because root owning is required for browser bin and parent folder 
- fix alacritty borders being white after restart (restarting AlacrittyAutoTheme.service fixes it ?)
