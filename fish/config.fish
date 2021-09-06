set -x EDITOR nvim
set -x VISUAL nvim

alias evil "env TERM=xterm-24bit emacs -nw" 
alias nve "nvim -c 'CocCommand explorer'"
alias fzf "fzf-tmux -p 80%,60%"
alias la "exa -la --git --git-ignore $argv"

alias gg "git add . && git commit"
alias gs "git status -vv"
alias gd "batdiff"

contains /usr/local/sbin $fish_user_paths; or set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
contains /Users/casey/.emacs.d/bin $fish_user_paths; or set -g fish_user_paths "/Users/casey/.emacs.d/bin" $fish_user_paths
contains /home/linuxbrew/.linuxbrew/bin $fish_user_paths; or set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths

# Colors
set -x LS_COLORS "(vivid generate snazzy)"

set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)

set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showstashstatus 1
set -g __fish_git_prompt_showupstream verbose
set -g __fish_git_prompt_showcolorhints 1

set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_branch FF69B4 --bold
set __fish_git_prompt_color_upstream_ahead yellow
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_stateseparator ':'

set -x BAT_THEME OneHalfDark

# FZF et al.

set -x FZF_DEFAULT_COMMAND  'rg --files --follow'
set -x FZF_DEFAULT_OPTS '--height 99% --preview "bat --color=always --style=numbers --line-range=:500 {}"'
set -x FZF_CTRL_T_COMMAND '$FZF_DEFAULT_COMMAND'
set -x FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

set diff_preview "git diff $argv --color=always -- {-1}"
set fzf_git_status_opts "--preview=$diff_preview"
set fzf_preview_dir_cmd "exa -T"

fzf_configure_bindings --directory=\ct --git_status=\cs --git_log=\cg --history=\cr --variables=\cv

function fdiff
  git diff $argv --name-only | fzf -m --ansi --preview $diff_preview
end
