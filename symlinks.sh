#!/bin/bash

PWD=$(pwd)

printf "\nSetting up config symlinks..."

ln -sf "$PWD"/karabiner ~/.config
ln -sf "$PWD"/nvim ~/.config
ln -sf "$PWD"/fish ~/.config
ln -sf "$PWD"/omf ~/.config
ln -sf "$PWD"/alacritty ~/.config

# vim backwards compat
ln -sf "$PWD"/nvim/init.vim ~/.vimrc

ln -sf "$PWD"/git_commit_message ~/.git_commit_message
ln -sf "$PWD"/gitconfig ~/.gitconfig
ln -sf "$PWD"/git-completion.bash ~/.git-completion.bash
ln -sf "$PWD"/eslintrc.js ~/.eslintrc.js
ln -sf "$PWD"/tmux.conf.local ~/.tmux.conf.local
ln -sf "$PWD"/spacemacs ~/.spacemacs
ln -sf "$PWD"/doom.d ~/.doom.d
ln -sf "$PWD"/prettierrc.js ~/.prettierrc.js
ln -sf "$PWD"/xprofile ~/.xprofile

printf " Done!\n\n"
