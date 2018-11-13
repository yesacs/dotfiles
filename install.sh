#!/bin/bash

PWD=$(pwd)

echo "Installing shit..."

#Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#ohMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

#Nvim
brew install neovim

#FZF
brew install fzf

#FiraCode
brew tap caskroom/fonts
brew cask install font-fira-code

#OhMyTmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf

echo "Setting up symlinks..."

rm ~/.vimrc; ln -s "$PWD"/init.vim ~/.vimrc
rm ~/.config/nvim/init.vim; "$PWD"/init.vim ~/.config/nvim/init.vim
rm ~/.config/karabiner/karabiner.json; "$PWD"/karabiner.json ~/.config/karabiner/karabiner.json

rm ~/.git_commit_message; ln -s "$PWD"/git_commit_message ~/.git_commit_message
rm ~/.gitconfig; ln -s "$PWD"/gitconfig ~/.gitconfig
rm ~/.git-completion.bash; ln -s "$PWD"/git-completion.bash ~/.git-completion.bash

rm ~/.eslintrc; ln -s "$PWD"/eslintrc ~/.eslintrc

rm ~/.tmux.conf.local; ln -s "$PWD"/tmux.conf.local ~/.tmux.conf.local
rm ~/.zshrc; ln -s "$PWD"/zshrc ~/.zshrc
