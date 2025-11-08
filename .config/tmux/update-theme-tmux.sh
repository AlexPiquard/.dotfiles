#!/bin/sh

FORMAT="${HOME}/.config/tmux/%s.tmux"

t="$(gsettings get org.gnome.desktop.interface color-scheme)"
if [ "$t" = "'prefer-dark'" ]; then
  THEME="tokyonight_moon"
else
  THEME="tokyonight_day"
fi

tmux source $(printf $FORMAT $THEME)
