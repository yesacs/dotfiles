#!/bin/bash

PWD=$(pwd)

echo "Installing shit..."

#Dein
printf "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
  
  brew install fortune
  brew install neovim
  brew install fzf
  brew install the_silver_searcher
  brew install ripgrep
  brew install ctags
  brew install bat
  brew install awscli
  
  #install emacs and spacemaces
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
  brew install emacs-plus
  
  # install fonts
  brew tap caskroom/fonts
  brew cask install font-source-code-pro 
  brew cask install font-fira-code
  brew cask install font-hack-nerd-font
  
  # install npm et. all
  brew install npm
  npm install -g yarn eslint vtop prettier neovim
  yarn add -g coc-json coc-tsserver coc-css coc-eslint coc-prettier

else
  printf "\n😓 Homebrew not found skipping brew setup, you may have to install
  some stuff manually\n\n"
fi

#ohMyTmux
printf "\n"
git clone https://github.com/gpakosz/.tmux.git ~/.tmux || 
  printf "😓 Tried to get ohMyTmux and failed, maybe you already got it?\n"

ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf

tic -x -o ~/.terminfo "$PWD"/xterm-24bit.terminfo

./symlinks.sh
./errata.sh

