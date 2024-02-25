#!/bin/bash

PWD=$(pwd)

printf "\nSetting up config symlinks..."

ln -sf "$PWD"/karabiner ~/.config
# ln -sf "$PWD"/nvim ~/.config
ln -sf "$PWD"/fish ~/.config
ln -sf "$PWD"/omf ~/.config
ln -sf "$PWD"/alacritty ~/.config
ln -sf "$PWD"/kitty ~/.config
ln -sf "$PWD"/doom.d ~/.doom.d

# vim backwards compat
ln -sf "$PWD"/nvim/init.vim ~/.vimrc

ln -sf "$PWD"/popuptmux.sh ~/.popuptmux.sh
ln -sf "$PWD"/git_commit_message ~/.git_commit_message
ln -sf "$PWD"/gitconfig ~/.gitconfig
ln -sf "$PWD"/git-completion.bash ~/.git-completion.bash
ln -sf "$PWD"/.eslintrc.js ~/.eslintrc.js
ln -sf "$PWD"/tmux.conf ~/.tmux.conf
ln -sf "$PWD"/spacemacs ~/.spacemacs
ln -sf "$PWD"/.prettierrc.js ~/.prettierrc.js
ln -sf "$PWD"/xprofile ~/.xprofile
ln -sf "$PWD"/noderc.js ~/.noderc.js 
ln -sf "$PWD"/zshrc ~/.zshrc
ln -sf "$PWD"/yabairc ~/.yabairc
ln -sf "$PWD"/skhdrc ~/.skhdrc

printf " Done!\n\n"
