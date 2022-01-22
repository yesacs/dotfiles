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
if command -v brew; then
  printf "😓 Homebrew installed already, skipping...\n\n"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v brew; then
  brew install fish exa vivid fortune neovim fd rg the_silver_searcher \
    fzf bat gotop neofetch ranger \
    yarn grip eth-p/software/bat-extras \
    clojure/tools/clojure adoptopenjdk redis leiningen \
    borkdude/brew/clj-kondo coreutils zprint

  #the correct emacs for mac
  brew tap railwaycat/emacsmacport
  brew install emacs-mac --with-modules

  # install fonts (only works on macs)
  brew tap homebrew/cask-fonts
  brew install --cask font-source-code-pro
  brew install --cask font-fira-code
  brew install --cask font-hack-nerd-font

  # neovim lsp support addons
  #https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
  npm install -g @fsouza/prettierd sass-lint eslint_d vim-language-server vscode-langservers-extracted typescript typescript-language-server diagnostic-languageserver
  brew install clojure-lsp/brew/clojure-lsp-native

  #oh my zsh
  #bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  #fisher | TODO fix
  #curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
  #fisher install PatrickF1/fzf.fish
  #fisher install jorgebucaran/nvm.fish

  #nvm install 14 #TODO fix
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
