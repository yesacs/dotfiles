function _fzf_search_git_branch --description "Search the output of git branches, local and remote. Replace the current token with the selected commit hash."
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo '_fzf_search_git_log: Not in a git repository.' >&2
    else
        set log_fmt_str '%C(bold blue)%h%C(reset) - %C(cyan)%ad%C(reset) %C(yellow)%d%C(reset) %C(normal)%s%C(reset)  %C(dim normal)[%an]%C(reset)'
        set selected_branch (
            git branch -a --color=always | \
            _fzf_wrapper --ansi \
                --tiebreak=index \
                --preview='git diff --color=always {1}' \
                --query=(commandline --current-token) \
                $fzf_git_branch_opts
        )
        if test $status -eq 0
            commandline --current-token --replace $selected_branch
        end
    end

    commandline --function repaint
end
