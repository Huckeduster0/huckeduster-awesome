# !/bin/bash

#######################################################################
# installing packages #################################################
#######################################################################

# updating before doing anything else
sudo pacman -Syyu --noconfifm 

# installing all packages in packages file 
sudo pacman -S $(grep -vE "^\s*#" packages-arch | tr "\n" " ") --noconfirm 

# adding flatpak and flathub 
sudo pacman -S flatpak --noconfirm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install $(grep -vE "^\s*#" flatpaks | tr "\n" " ") 

# installing the yay aur helper
if [ ! -d ~/gits.d ]; then
	mkdir ~/gits.d
fi

pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git ~/gits.d/yay
cd ~/gits.d/yay/
makepkg -si
cd ~ 

# installing all aur-packages in packages file 
yay -S $(grep -vE "^\s*#" packages-aur | tr "\n" " ") --noconfirm 


#######################################################################
# cloning git repos ###################################################
#######################################################################

# making folder for local gits
if [ ! -d ~/gits.d ]; then
	mkdir ~/gits.d
fi

# cloning git repos
git clone https://github.com/thelioncape/San-Francisco-family.git --depth 1 ~/gits.d/SF-fonts
git clone https://github.com/Murzchnvok/rofi-collection --depth 1 ~/gits.d/rofi-collection
git clone https://github.com/streetturtle/awesome-wm-widgets.git ~/gits.d/awesome-wm-widgets
git clone https://github.com/horst3180/arc-icon-theme --depth 1 ~/gits.d/arc-icon-theme


#######################################################################
# linking dotfiles  ###################################################
#######################################################################

# creating .config folder if not exists
if [ ! -d ~/.config ]; then
	mkdir ~/.config
fi

# moving existing dotfiles
# .bashrc
if [ -f ~/.bashrc ]; then
	mv ~/.bashrc ~/.bashrc.old
fi
if [ -f ~/.bash_aliases ]; then
	mv ~/.bash_aliases ~/.bash_aliases.old
fi
# .xinitrc , .xsessionrc
if [ -f ~/.xinitrc ]; then 
	mv ~/.xinitrc ~/.xinitrc.old
fi

# linking new dotfiles
ln -s ~/gits.d/Huckeduster-awesome/.bashrc ~/.bashrc
ln -s ~/gits.d/Huckeduster-awesome/.bash_aliases ~/.bash_aliases
ln -s ~/gits.d/Huckeduster-awesome/.xinitrc ~/.xinitrc
ln -s ~/gits.d/Huckeduster-awesome/.xsessionrc ~/.xsessionrc

#########################################################

# moving old .config-folders
if [ -d ~/.config/alacritty ]; then
	mv ~/.config/alacritty ~/.config/alacritty.old
fi
if [ -d ~/.config/awesome ]; then
	mv ~/.config/awesome ~/.config/awesome.old
fi
if [ -d ~/.config/neofetch ]; then
	mv ~/.config/neofetch ~/.config/neofetch.old
fi
if [ -d ~/.config/rofi ]; then
	mv ~/.config/rofi ~/.config/rofi.old
fi
if [ -d ~/.config/awesome/awesome-wm-widgets ]; then 
	rm -rf .config/awesome/awesome-wm-widgets
fi

# linking new config folders
ln -s ~/gits.d/Huckeduster-awesome/.config/alacritty ~/.config/alacritty
ln -s ~/gits.d/Huckeduster-awesome/.config/awesome ~/.config/awesome
ln -s ~/gits.d/Huckeduster-awesome/.config/neofetch ~/.config/neofetch
ln -s ~/gits.d/Huckeduster-awesome/.config/rofi ~/.config/rofi
ln -s ~/gits.d/awesome-wm-widgets/.config/awesome ~/.config/awesome/awesome-wm-widgets

#########################################################

# linking SF fonts 
mkdir -p ~/.local/share/fonts/SF-fonts 
ln -s ~/gits.d/SF-fonts/SF* $HOME/.local/share/fonts/SF-fonts/

# linking arc icon theme
mkdir -p ~/.local/share/icons
sudo ln -s ~/gits.d/arc-icon-theme/Arc /usr/share/icons/Arc

# linking rofi-themes, selecting rofi-themes
mkdir -p ~/.local/share/rofi/themes
ln -s ~/gits.d/rofi-collection/* ~/.local/share/rofi/themes/
rofi-theme-selector
