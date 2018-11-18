#!/bin/bash

PWD=$(pwd)

printf "\nSetting up config symlinks...\n"

ln -sf "$PWD"/karabiner ~/.config
ln -sf "$PWD"/nvim ~/.config
ln -sf "$PWD"/fish ~/.config
ln -sf "$PWD"/omf ~/.config
ln -sf "$PWD"/alacritty ~/.config

ln -sf "$PWD"/init.vim ~/.vimrc
ln -sf "$PWD"/git_commit_message ~/.git_commit_message
ln -sf "$PWD"/gitconfig ~/.gitconfig
ln -sf "$PWD"/git-completion.bash ~/.git-completion.bash
ln -sf "$PWD"/eslintrc ~/.eslintrc
ln -sf "$PWD"/tmux.conf.local ~/.tmux.conf.local

