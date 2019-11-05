set -x EDITOR nvim
set -x VISUAL nvim

alias evil "env TERM=xterm-24bit emacs -nw" 

set -x FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
