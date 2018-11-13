#!/bin/bash

PWD=$(pwd)
BREW=$(command -v brew)

echo "Installing shit..."

#Homebrew
if command -v brew
then 
echo "!!!!  Brew installed already, skipping"
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

#FiraCode
brew tap caskroom/fonts
brew cask install font-fira-code
else
  echo "!!!!  Homebrew not found skipping brew setup, you may have to install
  manually"
fi

#OhMyTmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf

echo "Setting up config symlinks..."

ln -sf "$PWD"/init.vim ~/.vimrc
mkdir ~/.config/nvim; ln -sf "$PWD"/init.vim ~/.config/nvim/init.vim
mkdir ~/.config/karabiner; ln -sf "$PWD"/karabiner.json ~/.config/karabiner/karabiner.json

ln -sf "$PWD"/git_commit_message ~/.git_commit_message
ln -sf "$PWD"/gitconfig ~/.gitconfig
ln -sf "$PWD"/git-completion.bash ~/.git-completion.bash

ln -sf "$PWD"/eslintrc ~/.eslintrc

ln -sf "$PWD"/tmux.conf.local ~/.tmux.conf.local
ln -sf "$PWD"/zshrc ~/.zshrc

#ohMyZsh for last
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


