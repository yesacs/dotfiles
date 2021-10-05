function _fzf_search_git_branch --description "Search the output of git branches, local and remote. Replace the current token with the selected commit hash."
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo '_fzf_search_git_log: Not in a git repository.' >&2
    else
        set selected_branch (
            git branch -a --color=always | \
            _fzf_wrapper --ansi \
                --tiebreak=index \
                --preview='git log --stat --color=always {1}' \
                --query=(commandline --current-token) \
                $fzf_git_branch_opts
        )
        if test $status -eq 0
            set branch_name (string replace --all " " "" $selected_branch)
            commandline --current-token --replace $branch_name
        end
    end

    commandline --function repaint
end
