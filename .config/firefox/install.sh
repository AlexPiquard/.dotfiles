#!/bin/bash

tarball_dir="$HOME/.tarball-installations"
install_dir="$tarball_dir/firefox"
executable_path="$install_dir/firefox"
icon_path="$install_dir/browser/chrome/icons/default128.png"
desktop_file="$HOME/.local/share/applications/firefox.desktop"

cd $tarball_dir
rm -rf $install_dir
mkdir $install_dir
cd $install_dir

curl -L "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" | tar xJvf - --strip-components=1

ln -s ~/.config/firefox/firefox.desktop $desktop_file
