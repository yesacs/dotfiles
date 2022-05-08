#!/usr/bin/env bash
set -euo pipefail

./symlinks.sh

# brew setup
printf "Installing HomeBrew...\n"
if command -v brew; then
  printf "😓 Homebrew installed already, skipping...\n\n"
else
  # this is kinda messy
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/casey/.profile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential || printf ""
  source ~/.profile
fi

brew install gcc \
	     fish \
             tmux \
             exa \
             vivid \
             fd \
             rg \
             the_silver_searcher \
             fzf \
             gotop \
             neofetch \
             ranger \
             yarn \
             grip \
             bat \
             eth-p/software/bat-extras \
             coreutils \
             neovim

# install fonts (only works on macs)
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew tap homebrew/cask-fonts
  brew install --cask font-source-code-pro
  brew install --cask font-fira-code
  brew install --cask font-hack-nerd-font
fi
# brew setup -- END

# lsp setup
printf "Setting up LSPs and REPLs...\n\n"

mkdir ~/.nvm || printf ""
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

nvm install 14
nvm use 14

#https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
npm install -g @fsouza/prettierd \
               sass-lint \
               eslint_d \
               vim-language-server \
               vscode-langservers-extracted \
               typescript \
               typescript-language-server \
               diagnostic-languageserver

brew install clojure-lsp/brew/clojure-lsp-native \
             clojure/tools/clojure \
             borkdude/brew/clj-kondo

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install adoptopenjdk zprint
fi
# lsp setup -- END

# neovim setup
printf "Setting up Neovim...\n\n"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# neovim setup -- END

# doom setup
printf "Setting up Doom...\n\n"

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew tap railwaycat/emacsmacport
  brew install emacs-mac --with-modules
else
  sudo apt remove emacs
  sudo apt autoremove

  sudo snap install emacs --classic
fi

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d || printf ""
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync
# doom setup -- END

# tmux setup
printf "\n"
git clone https://github.com/gpakosz/.tmux.git ~/.tmux ||
  printf "😓 Tried to get ohMyTmux and failed, maybe you already got it?\n"

ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
tic -x -o ~/.terminfo "$PWD"/xterm-24bit.terminfo
# tmux setup -- END

./errata.sh
