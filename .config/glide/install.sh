#!/bin/bash

tarball_dir="$HOME/.tarball-installations"
install_dir="$tarball_dir/glide"
executable_path="$install_dir/glide"
icon_path="$install_dir/browser/chrome/icons/default/default128.png"
desktop_file="$HOME/.local/share/applications/glide.desktop"

cd $tarball_dir
rm -rf $install_dir
mkdir $install_dir
cd $install_dir

curl -L "https://github.com/glide-browser/glide/releases/latest/download/glide.linux-x86_64.tar.xz" | tar xJvf - --strip-components=1

sudo ln -s /opt/google/chrome/WidevineCdm $install_dir/

rm -f $desktop_file
touch $desktop_file
echo "
[Desktop Entry]
Version=1.0
Type=Application
Exec=$executable_path %u
Terminal=false
X-MultipleArgs=false
Icon=$icon_path
StartupWMClass=glide-glide
DBusActivatable=false
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=application/json;application/pdf;application/rdf+xml;application/rss+xml;application/x-xpinstall;application/xhtml+xml;application/xml;audio/flac;audio/ogg;audio/webm;image/avif;image/gif;image/jpeg;image/png;image/svg+xml;image/webp;text/html;text/xml;video/ogg;video/webm;x-scheme-handler/chrome;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/mailto;
StartupNotify=true
Actions=new-window;new-private-window;open-profile-manager;
Name=Glide Browser
Comment=An extensible and keyboard-focused web browser
GenericName=Web Browser
Keywords=Internet;WWW;Browser;Web;Explorer;
[Desktop Action new-window]
Exec=$executable_path --new-window %u
Name=New Window
[Desktop Action new-private-window]
Exec=$executable_path --private-window %u
Name=New Private Window
[Desktop Action open-profile-manager]
Exec=$executable_path --ProfileManager
Name=Open Profile Manager
" >> $desktop_file

