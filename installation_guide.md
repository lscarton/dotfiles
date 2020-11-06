# Installation Guide

Add instructions for install i3 gaps

```
ln -s ~/dotfiles/config/i3/config ~/.config/i3/config
ln -s ~/dotfiles/config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf

sudo apt install ranger
sudo apt install i3blocks
sudo apt install rxvt-unicode-256color
sudo apt install dmenu
sudo apt install rofi
sudo apt install i3lock
sudo apt install pulseaudio-utils

echo "/home/dharmin" > ~/.lastdir
echo "1.0" > ~/.config/brightness
```

# install playerctl
```
wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/libplayerctl2_2.0.1-1_amd64.deb
wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/playerctl_2.0.1-1_amd64.deb
sudo dpkg -i libplayerctl2_2.0.1-1_amd64.deb playerctl_2.0.1-1_amd64.deb

sudo apt install libxrandr2
sudo apt install scrot

ln -s ~/dotfiles/Xdefaults ~/.Xdefaults
ln -s ~/dotfiles/config/i3/config ~/.config/i3/config

sudo apt install jq
sudo apt install feh
sudo apt install imagemagick
```

### install brave browser beta
```
sudo apt install apt-transport-https curl gnupg

curl -s https://brave-browser-apt-beta.s3.brave.com/brave-core-nightly.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-prerelease.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-beta.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-beta.list

sudo apt update

sudo apt install brave-browser-beta
```

```
sudo apt install sylpheed
```

### install and use zsh (logout and login for zsh to work)
```
sudo apt install zsh
chsh -s /usr/bin/zsh
```
```
sudo apt install neofetch
ln -s ~/dotfiles/config/ranger ~/.config/ranger
ln -s ~/dotfiles/urxvt ~/.urxvt
```

### setup vim
```
sudo apt install vim-gnome
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
vim
:PlugInstall
:qa
```

### brightness

- install light from github
- build and install

```
sudo chmod s+u /usr/bin/light
```

### screen tear and transparency

```
sudo apt install compton
```
log out and log back in
