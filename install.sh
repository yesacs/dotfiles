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
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    sudo apt-get install build-essential || printf ""
    source ~/.profile
fi

brew install gcc \
    fish \
    tmux \
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
    neovim \
    node \
    vint \
    luarocks \
    wget \
    pyenv \
    autossh \
    gopass \
    jq \
    direnv

# lsp setup
printf "Setting up LSPs and REPLs...\n\n"

mkdir ~/.nvm || printf ""
mkdir ~/.local/share/nvm || printf ""
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR=$HOME/.nvm
source $NVM_DIR/nvm.sh

#https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
npm install -g @fsouza/prettierd \
    sass-lint \
    stylelint \
    eslint \
    eslint_d \
    luacheck \
    lua-format \
    vim-language-server \
    vscode-langservers-extracted \
    typescript \
    typescript-language-server \
    diagnostic-languageserver

brew install clojure-lsp/brew/clojure-lsp-native \
    clojure/tools/clojure \
    leiningen \
    borkdude/brew/clj-kondo

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install --cask adoptopenjdk 
    brew install zprint
    brew install --cask amethyst
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

# tmux/tpm setup
printf "\n"
if [[ -d "~/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "TPM found, skipping..."
fi

tic -x -o ~/.terminfo "$PWD"/xterm-24bit.terminfo
# tmux setup -- END

# pyenv install 2.7.18
nvm install 14

./awscli.sh
./errata.sh
