set -x EDITOR nvim
set -x VISUAL nvim


alias evil "env TERM=xterm-24bit emacs -nw"
alias nve "nvim -c 'CocCommand explorer'"
alias fzf "fzf-tmux -p 80%,60%"
# alias la "exa -la --git --git-ignore $argv"
alias la "exa -la $argv"
alias kssh "kitty +kitten ssh"

alias gg "git add . && git commit"
alias gs "git status -vv"
alias gd "git diff"

alias httpdir "python -m SimpleHTTPServer 8000"

alias cider "clj -Sdeps '{:deps {cider/cider-nrepl {:mvn/version \"0.21.1\"} }}' -m nrepl.cmdline --middleware \"[cider.nrepl/cider-middleware]\""

contains /usr/local/sbin $fish_user_paths; or set -g fish_user_paths /usr/local/sbin $fish_user_paths
contains /home/linuxbrew/.linuxbrew/bin $fish_user_paths; or set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
contains /home/linuxbrew/.linuxbrew/bin $fish_user_paths; or set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
contains /home/casey/.emacs.d/bin $fish_user_paths; or set -g fish_user_paths "/home/casey/.emacs.d/bin" $fish_user_paths

# Colors
#set -x LS_COLORS "(vivid generate snazzy)"

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

set -x FZF_DEFAULT_COMMAND 'rg --files --follow'
set -x FZF_DEFAULT_OPTS '--height 99% --preview "bat --color=always --style=numbers --line-range=:500 {}" --bind "ctrl-j:preview-down,ctrl-k:preview-up"'
set -x FZF_CTRL_T_COMMAND '$FZF_DEFAULT_COMMAND'
set -x FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

set diff_preview "git diff $argv --color=always -- {-1}"
set fzf_git_status_opts "--preview=$diff_preview"
set fzf_preview_dir_cmd "exa -T"

fzf_configure_bindings --directory=\ct --git_status=\cs --git_log=\cg --history=\cr --variables=\cv --git_branch=\cq

function fdiff
    git diff $argv --name-only | fzf -m --ansi --preview $diff_preview
end

source ~/.env

function popuptmux
    if [ "(tmux display-message -p -F \"#{session_name}\")" = popup ]
        tmux detach-client
    else
        tmux popup -E "tmux attach -t popup || tmux new -s popup"
    end
end

# pyenv setup needed for quote-tool repo
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
fish_add_path $PYENV_ROOT/versions/2.7.18/bin/
fish_add_path /opt/homebrew/bin
fish_add_path ~/apache-maven-3.8.8/bin
fish_add_path /opt/homebrew/opt/mysql@8.4/bin

alias redis "docker run --rm -p 6379:6379 redis:6.2"
alias vi "NVIM_APPNAME=astronvim_v4 nvim"
alias iq-np-tunnel "AWS_PROFILE=iq-np ~/Sites/ft-api/infra/accounts/iq-np/bin/ft-api-db-dev-open-db-tunnel.sh"


alias java-11="set JAVA_HOME $(/usr/libexec/java_home -v 11); java -version"
alias java-21="set JAVA_HOME $(/usr/libexec/java_home -v 21); java -version"

alias refresh-keys="eval (aws configure export-credentials --format env)"
alias ssmin="aws ssm start-session --target $1"

fish_ssh_agent
