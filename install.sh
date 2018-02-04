#!/bin/bash

mv .vim ~/.vim
mv .vimrc ~/.vimrc
mv .bashrc ~/.bashrc
mv .bash_colors ~/.bash_colors
mv .screenrc ~/.screenrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +VundleInstall +qa
sudo apt-get install -y build-essential cmake python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --go-completer
