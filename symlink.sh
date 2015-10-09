#!/bin/bash

PWD=$(pwd)



echo "Making vim symlinks for vim settings"
rm ~/.vimrc; ln -s "$PWD"/vimrc.vimrc ~/.vimrc
rm ~/.vim; ln -s "$PWD"/vim/ ~/.vim
rm ~/.vimrc.bundles; ln -s "$PWD"/vimrc.bundles ~/.vimrc.bundles
rm ~/.vimrc.local;ln -s "$PWD"/vimrc.local ~/.vimrc.local

# for some reason this needs to get pulled down againt
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



echo "Making symlinks for profile settings"
rm ~/.profile; ln -sf "$PWD"/profile ~/.profile
source ~/.profile



echo "Making symlinks for git template"
rm ~/.git_commit_message; ln -s "$PWD"/git_commit_message ~/.git_commit_message
git config --global commit.template ~/.git_commit_message



echo "All Done!"
