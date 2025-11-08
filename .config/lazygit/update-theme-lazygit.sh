#!/bin/sh

t="$(gsettings get org.gnome.desktop.interface color-scheme)"
if [ "$t" = "'prefer-dark'" ]; then
  THEME="tokyonight_moon"
else
  THEME="tokyonight_day"
fi

ln -sf "$HOME/.config/lazygit/$THEME.yml" "$HOME/.config/lazygit/theme.yml"
