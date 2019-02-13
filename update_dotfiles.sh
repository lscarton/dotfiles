#! /bin/sh

# update the dotfiles from different locations

# bashrc, bash_alias, Xdefaults, vimrc
cp ~/.bashrc ./bashrc
cp ~/.bash_aliases ./bash_aliases
cp ~/.Xdefaults ./Xdefaults
cp ~/.vimrc ./vimrc

# .urxvt/ .i3/
rm -rf ./i3
cp -r ~/.i3 ./i3

rm -rf ./urxvt
cp -r ~/.urxvt ./urxvt

# # some folder in .vim
rm -rf ./vim
mkdir ./vim
cp -r ~/.vim/autoload ./vim
cp -r ~/.vim/colors ./vim
cp -r ~/.vim/spell ./vim
cp -r ~/.vim/snippets ./vim


# folder from .config/
cp -r ~/.config/neofetch ./config
cp -r ~/.config/rofi ./config
cp -r ~/.config/ranger ./config
cp -r ~/.config/zathura ./config

# remove ranger history
rm ./config/ranger/history
