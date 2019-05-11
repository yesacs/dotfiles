set -gx EDITOR nvim
set -gx VISUAL nvim

set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths

alias evil "env TERM=xterm-24bit emacs -nw" 

set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'
