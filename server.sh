#! /bin/bash
printf "Installing op-server... \nThis might take a while... " >&2
{
sudo useradd -m op
sudo adduser op sudo
echo 'op:##Teki@123' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get install ubuntu-desktop 
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser op chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete \nCreated new user op with password: ##Teki@123 \nYou can change both op's password with passwd(with no sudo) \nOr you can change root's password with sudo passwd" >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless and copy command of Debian Linux \n'
read -p "Paste Here: " CRP
su - op -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi
