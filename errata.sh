#!/bin/bash

printf "\n##################  ERRATA ##################"

printf "\n\nthe iTerm theme you like MonokaiSoda"

printf "\n\nyou might have to install npm, yarn and prettier"

printf "\n\nhave some custom vim stuff for this host?"
printf "\nput it in ~/.config/init.local.vim"

printf "\n\nadd fish to /etc/shells "
printf "\n$ sudo echo /usr/local/bin/fish >> /etc/shells"

printf "\n\nmake fish your default shell"
printf "\n$ chsh -s /usr/local/bin/fish"

printf "\n\nmake zsh your default shell"
printf "\n$ chsh -s /bin/zsh"

printf "\n\non a mac? install xcode and then"
printf "\n$ sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"

printf "\n\nCaps <=> Escape on Ubuntu"
printf "\n$ sudo apt install xcape"
printf "\nhttps://askubuntu.com/a/750535" 

printf "\n\nMosh True color"
printf "\nhttps://github.com/mobile-shell/mosh/issues/961"

printf "\n\nLinuxbrew? If you hate yourself"
printf "\nhttps://docs.brew.sh/Homebrew-on-Linux"

printf "\n\nFunny chars using ssh in ktty?"
printf "\ninfocmp -a xterm-kitty | ssh myserver tic -x -o \~/.terminfo/dev/stdin"

printf "\n\nInstall TPM plugins?"
printf "\n[TMUX PREFIX] + I"

printf "\n\nTree-sitter errors when editing inti.vim?"
printf "\n:echo nvim_get_runtime_file('parser', v:true)"
printf "\n[then move/delete the ones that aren't nvim-treesitter"

printf "\n\nWant a native alacrity icon?"
printf "\nhttps://github.com/hmarr/dotfiles/blob/main/bin/update-alacritty-icon.sh"

printf "\n\n"
