#!/bin/bash

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
curl -s https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein > /dev/null
rm ./installer.sh

if command -v brew
then
  
# install Nvim
brew install neovim

# install FZF
brew install fzf

# install bat
brew install bat

# install FiraCode
brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-hack-nerd-font

else
  printf "!!!!  Homebrew not found skipping brew setup, you may have to install
  some stuff manually"
fi

#ohMyTmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf

./symlinks.sh

tic "$PWD"/iTerm-italics-fix



################################################################################



# the iTerm theme you like MonokaiSoda
# you probably still need to install ohMyFish
#curl -L https://get.oh-my.fish | fish
