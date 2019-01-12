#!/bin/bash

PWD=$(pwd)

echo "Installing shit..."

#Dein
printf "Installing Dein..."
curl -s https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein > /dev/null
rm ./installer.sh
printf " Done!\n\n"

#Homebrew
printf "Installing HomeBrew...\n"
if command -v brew
then 
 printf "😓 Homebrew installed already, skipping...\n\n"
else
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if command -v brew
then

#install fish
brew install fish
curl -L https://get.oh-my.fish | fish

#install fortune  
brew install fortune

# install Nvim
brew install neovim

# install search tools
brew install fzf
brew install the_silver_searcher

# install bat
brew install bat

# install FiraCode
brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-hack-nerd-font

else
  printf "\n😓 Homebrew not found skipping brew setup, you may have to install
  some stuff manually\n\n"
fi

#ohMyTmux
printf "\n"
git clone https://github.com/gpakosz/.tmux.git ~/.tmux || 
  printf "😓 Tried to get ohMyTmux and failed, maybe you already got it?\n"

ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf

tic "$PWD"/iTerm-italics-fix

./symlinks.sh
./errata.sh

