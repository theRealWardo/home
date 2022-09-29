#!/bin/bash

if [[ `go version` = "" ]]; then
  echo "go is not installed."
  exit 1
fi

mv .vim ~/.vim
mv .vimrc ~/.vimrc
mv .bashrc ~/.bashrc
mv .bash_colors ~/.bash_colors
mv .screenrc ~/.screenrc

if [[ `uname` = "Darwin" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew doctor
  brew install cmake
else
  sudo apt-get install -y build-essential cmake python-dev python3-dev
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +VundleInstall +qa
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --go-completer
