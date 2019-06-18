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

printf "\n\nonce fish is your default shell, for vim mode do "
printf "\n$ fish_vi_key_bindings"

printf "\n\nyou probably want to install ohMyFish"
printf "\n$ curl -L https://get.oh-my.fish | fish"

printf "\n\non a mac? install xcode and then"
printf "\n$ sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"

printf "\n\nAlacritty feeling slow on mac?"
printf "\n$ defaults write -g InitialKeyRepeat -int 10"
printf "\n$ defaults write -g KeyRepeat -int 1"
printf "\nRead more here:
https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x"
printf "\nOR:"
printf "\n$ defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool true"

printf "\n\nCaps <=> Escape on Ubuntu"
printf "\n$ sudo apt install xcape"
printf "\nhttps://askubuntu.com/a/750535" 

printf "\n\nNeoVim intellisense"
printf "\n:CocInstall coc-json coc-tsserver coc-css"

printf "\n\n"
