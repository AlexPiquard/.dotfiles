curl -LO -o ./zen.linux-x86_64.tar.xz  https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz
sudo rm -rf /opt/zen
sudo tar xf zen.linux-x86_64.tar.xz -C /opt
sudo rm zen.linux-x86_64.tar.xz
