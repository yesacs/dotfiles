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
ln -sf "$PWD"/profile ~/.bash_profile
#source ~/.bash_profile


echo "Making symlinks for git configs"
rm ~/.git_commit_message; ln -s "$PWD"/git_commit_message ~/.git_commit_message
rm ~/.gitconfig; ln -s "$PWD"/gitconfig ~/.gitconfig
rm ~/.git-completion.bash; ln -s "$PWD"/git-completion.bash ~/.git-completion.bash


echo "Making symlinks for hinters and linters"
rm ~/.eslintrc; ln -s "$PWD"/eslintrc ~/.eslintrc


echo "All Done!"
