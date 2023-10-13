# !/bin/bash

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
ln -s .bashrc ~/.bashrc
ln -s .bash_aliases ~/.bash_aliases
ln -s .xinitrc ~/.xinitrc
ln -s .xsessionrc ~/.xsessionrc

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

# linking new config folders
ln -s .config/alacritty ~/.config/alacritty
ln -s .config/awesome ~/.config/awesome
ln -s .config/neofetch ~/.config/neofetch

#########################################################

# linking SF fonts 
mkdir -p ~/.local/share/fonts/SF-fonts 
ln -s ~/gits.d/SF-fonts/SF* $HOME/.local/share/fonts/SF-fonts/
