#!/bin/bash

DIR=~/.vim
REPO=$(pwd)
DEIN_URL=https://github.com/Shougo/dein.vim.git
FONTS_URL=https://github.com/powerline/fonts.git

mkdir $DIR
cp -R colors $DIR
cp -R syntax $DIR
cd $DIR

# Install
echo "Install Vim/Neovim plugin manager"
mkdir dein
git clone $DEIN_URL $REPO/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $REPO/installer.sh
sh $REPO/installer.sh dein

# Install fonts
echo "Install Powerline fonts"
git clone $FONTS_URL $REPO/fonts
fonts/install.sh


cp $REPO/.vimrc ~/
vim +":call dein#install()"
