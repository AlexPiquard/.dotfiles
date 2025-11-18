# Default installations

- `sudo apt install alacritty`
- 1password
- zsh
    - `sudo apt install zsh`
    - `chsh -s $(which zsh)`
    - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" `

# Brew

`brew install $(cat brew-packages.txt)`

# Browser

`./.config/zen/install.sh`

# Dotfiles

Install : `stow .`

Pull changes into repo : `stow --adopt .`

# Tmux

```
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.config/tmux/tmux.conf
```

# Auto theming

`sudo systemctl enable AlacrittyAutoTheme`

# TODO

use a terminal supporting images, and use snacks.image (kitty or ghostty)

1password integration with zen browser not working because root owning is required for zen bin and parent folder 

fix alacritty borders being white after restart
