# Default installations

- `sudo apt install alacritty`
- 1password
- `sudo apt install zsh`
  `chsh -s $(which zsh)`
  `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" `

# Brew

`brew install $(cat brew-packages.txt)`

# Dotfiles

Install : `stow .`
Pull changes into repo : `stow --adopt .`

# Tmux

`sudo apt install tmux`
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
`tmux source ~/.config/tmux/tmux.conf`
