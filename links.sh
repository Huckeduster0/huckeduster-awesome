# !/bin/bash

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
if [ -f ~/.xsessionrc ]; then 
	mv ~/.xsessionrc ~/.xsessionrc.old
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

# linking new config folders
ln -s ~/gits.d/Huckeduster-awesome/.config/alacritty ~/.config/alacritty
ln -s ~/gits.d/Huckeduster-awesome/.config/awesome ~/.config/awesome
ln -s ~/gits.d/Huckeduster-awesome/.config/neofetch ~/.config/neofetch
ln -s ~/gits.d/Huckeduster-awesome/.config/rofi ~/.config/rofi

#########################################################

# linking SF fonts 
mkdir -p ~/.local/share/fonts/SF-fonts 
ln -s ~/gits.d/SF-fonts/SF* $HOME/.local/share/fonts/SF-fonts/

# linking rofi-themes, selecting rofi-themes
mkdir -p ~/.local/share/rofi/themes
ln -s ~/gits.d/rofi-collection/* ~/.local/share/rofi/themes/
rofi-theme-selector
