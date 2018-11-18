#!/bin/bash

# the iTerm theme you like MonokaiSoda
PWD=$(pwd)
BREW=$(command -v brew)

echo "Installing shit..."

#Homebrew
if command -v brew
then 
printf "!!!!  Brew installed already, skipping"
else
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

if command -v brew
then
#Nvim
brew install neovim

#FZF
brew install fzf

#bat
brew install bat

#FiraCode
brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-hack-nerd-font

else
  printf "!!!!  Homebrew not found skipping brew setup, you may have to install
  manually"
fi

#ohMyTmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf

#ohMyFish
#curl -L https://get.oh-my.fish | fish

printf "\n Setting up config symlinks...\n"

ln -sf "$PWD"/nvim ~/.config/nvim/
ln -sf "$PWD"/alacritty ~/.config/alacritty
ln -sf "$PWD"/karabiner ~/.config/karabiner/
ln -sf "$PWD"/fish ~/.config/fish/
ln -sf "$PWD"/omf ~/.config/omf/

ln -sf "$PWD"/init.vim ~/.vimrc
ln -sf "$PWD"/git_commit_message ~/.git_commit_message
ln -sf "$PWD"/gitconfig ~/.gitconfig
ln -sf "$PWD"/git-completion.bash ~/.git-completion.bash
ln -sf "$PWD"/eslintrc ~/.eslintrc
ln -sf "$PWD"/tmux.conf.local ~/.tmux.conf.local

tic "$PWD"/iTerm-italics-fix

