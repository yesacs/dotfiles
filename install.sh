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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v brew
then
  #install fish, fisher, fzf
  brew install fish
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
  fisher install PatrickF1/fzf.fish
 
  brew install exa vivid fortune neovim fd rg the_silver_searcher fzf bat gotop neofetch ranger clojure/tools/clojure java node npm yarn grip eth-p/software/bat-extras
  
  # install fonts (only works on macs)
  brew tap homebrew/cask-fonts
  brew install --cask font-source-code-pro 
  brew install --cask font-fira-code
  brew install --cask font-hack-nerd-font

  yarn global add prettier typescript eslint sass-lint
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

