#!/bin/bash

DIR=~/.vim
REPO=$(pwd)

mkdir $DIR
cp -R colors $DIR
cp -R syntax $DIR
cd $DIR

# Install
echo "Install Vim/Neovim plugin manager"
mkdir dein
git clone https://github.com/Shougo/dein.vim.git
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh dein

# Install fonts
echo "Install Powerline fonts"
git clone https://github.com/powerline/fonts.git fonts
fonts/install.sh


cp $REPO/.vimrc ~/
vim +":call dein#install()"
