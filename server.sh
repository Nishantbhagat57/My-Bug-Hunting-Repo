#! /bin/bash
sudo apt update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
sudo apt install xfce4  xfce4-goodies -y
sudo apt update && sudo apt upgrade 
