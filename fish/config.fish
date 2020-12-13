set -x EDITOR nvim
set -x VISUAL nvim

alias evil "env TERM=xterm-24bit emacs -nw" 

set -x FZF_DEFAULT_COMMAND  'rg --files --follow'
set -x FZF_CTRL_T_COMMAND '$FZF_DEFAULT_COMMAND'
set -x FZF_DEFAULT_OPTS '--no-height --preview "bat {}"'

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/Users/casey/.emacs.d/bin" $fish_user_paths
