#! /bin/bash
sudo apt-get install ubuntu-desktop 
sudo add-apt-repository -r ppa:yorba/ppa
sudo apt-get update && sudo apt-get upgrade
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
apt install chrome-remote-desktop_current_amd64.deb
sudo DEBIAN_FRONTEND=noninteractive apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo apt install xfce4  xfce4-goodies -y
sudo apt install nautilus nano -y 
sudo adduser teki chrome-remote-desktop
sudo apt-get upgrade
