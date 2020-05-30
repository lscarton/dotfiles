#! /bin/sh

# update the dotfiles from different locations

# Xdefaults, vimrc
cp ~/.zshrc ./zshrc
cp ~/.source_list ./source_list
cp ~/.Xdefaults ./Xdefaults
cp ~/.vimrc ./vimrc
cp ~/.tmux.conf ./tmux.conf

rm -rf ./urxvt
cp -r ~/.urxvt ./urxvt

# some folders in .vim
rm -rf ./vim
mkdir ./vim
cp -r ~/.vim/autoload ./vim
cp -r ~/.vim/colors ./vim
cp -r ~/.vim/spell ./vim
cp -r ~/.vim/UltiSnips ./vim


# folder from .config/
cp -r ~/.config/i3 ./config
cp -r ~/.config/neofetch ./config
cp -r ~/.config/rofi ./config
cp -r ~/.config/ranger ./config
cp -r ~/.config/zathura ./config
cp -r ~/.config/mutt/*muttrc ./config/mutt

# remove ranger history and bookmark
rm ./config/ranger/history
rm ./config/ranger/bookmarks
