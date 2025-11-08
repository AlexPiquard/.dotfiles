#!/bin/bash

interface="org.freedesktop.portal.Settings"
monitor_path="/org/freedesktop/portal/desktop"
monitor_member="SettingChanged"
count=0 #D-Bus fires the change event 4 times so we'll only act on it once

dbus-monitor --profile "interface='$interface',path=$monitor_path,member=$monitor_member" |
	while read line; do
		let count++

		if [ $count = 3 ]; then
			theme="$(gsettings get org.gnome.desktop.interface color-scheme)"

			# tmux
			~/.config/tmux/update-theme-tmux.sh

			# lazygit
			~/.config/lazygit/update-theme-lazygit.sh

			# alacritty
			echo "[general]" > ~/.config/alacritty/auto-theme/theme.toml
			if [[ "$theme" == "'prefer-dark'" ]]; then
				#Need to set with full paths, goofy things are happening otherwise
				echo "import = [ '~/.config/alacritty/tokyonight-moon.toml' ]" >> ~/.config/alacritty/auto-theme/theme.toml
			else
				echo "import = [ '~/.config/alacritty/tokyonight-day.toml' ]" >> ~/.config/alacritty/auto-theme/theme.toml
			fi
			count=0
		fi 
	done
