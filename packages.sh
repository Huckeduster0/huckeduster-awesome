# !/bin/bash

# updating before doing anything else
sudo apt update -y && sudo apt upgrade -y 

# installing and fetching nala
sudo apt install nala -y 
sudo nala fetch 

# installing all packages in packages file 
sudo nala install $(grep -vE "^\s*#" packages | tr "\n" " ") -y 

# adding flatpak and flathub 
sudo nala install flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install $(grep -vE "^\s*#" flatpaks | tr "\n" " ") -y 

# dbus-stuff for flatpaks to be able to launch on ubuntu + X11
export $(dbus-launch) 
