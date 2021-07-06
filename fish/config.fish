set -x EDITOR nvim
set -x VISUAL nvim

alias evil "env TERM=xterm-24bit emacs -nw" 

set -x FZF_DEFAULT_COMMAND  'rg --files --follow'
set -x FZF_CTRL_T_COMMAND '$FZF_DEFAULT_COMMAND'
set -x FZF_DEFAULT_OPTS '--no-height --preview "bat {}"'

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/Users/casey/.emacs.d/bin" $fish_user_paths

# Colors
set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)

set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showupstream informative 
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_use_informative_chars 0
set -g __fish_git_prompt_show_informative_status 1

set __fish_git_prompt_color_branch FF69B4 --bold
# set __fish_git_prompt_color_dirtystate white
# set __fish_git_prompt_color_invalidstate red
# set __fish_git_prompt_color_merging yellow
# set __fish_git_prompt_color_stagedstate yellow
# set __fish_git_prompt_color_upstream_ahead green
# set __fish_git_prompt_color_upstream_behind red


# Icons
# set __fish_git_prompt_char_cleanstate '👍'
# set __fish_git_prompt_char_conflictedstate '⚠️'
# set __fish_git_prompt_char_dirtystate ' 💩'
# set __fish_git_prompt_char_invalidstate ' 🤮'
# set __fish_git_prompt_char_stagedstate ' 🚥'
# set __fish_git_prompt_char_stashstate ' 📦'
set __fish_git_prompt_char_stateseparator \UE0A0
# set __fish_git_prompt_char_untrackedfiles ' 🔍'
# set __fish_git_prompt_char_upstream_ahead '☝️'
# set __fish_git_prompt_char_upstream_behind '👇'
# set __fish_git_prompt_char_upstream_diverged ' 🚧'
# set __fish_git_prompt_char_upstream_equal '💯'
