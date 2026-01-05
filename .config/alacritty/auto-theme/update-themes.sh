theme="$1"
if [ ! $theme ]; then
    theme="'prefer-dark'"
fi

# tmux
~/.config/alacritty/auto-theme/update-theme.sh "$theme" "tmux/%s.tmux"
tmux source ~/.config/tmux/theme.tmux

# lazygit
~/.config/alacritty/auto-theme/update-theme.sh "$theme" "lazygit/%s.yml"

# opencode
~/.config/alacritty/auto-theme/update-theme.sh "$theme" "opencode/themes/%s.json"

# alacritty
echo "[general]" > ~/.config/alacritty/auto-theme/theme.toml
if [[ "$theme" == "'prefer-dark'" ]]; then
	#Need to set with full paths, goofy things are happening otherwise
	echo "import = [ '~/.config/alacritty/tokyonight-moon.toml' ]" >> ~/.config/alacritty/auto-theme/theme.toml
else
	echo "import = [ '~/.config/alacritty/tokyonight-day.toml' ]" >> ~/.config/alacritty/auto-theme/theme.toml
fi

