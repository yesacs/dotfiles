function! FzfMagic(shell_command,...)
    " Preview command = ARG2. Default to bat if no argument was given.
    let preview = get(a:, 1, 'bat --color always {}')

    let tempfile = system('mktemp')

    " Overlay alacritty over the current window using alacritty --embed,
    " redirect output to a temporary file
    execute system('alacritty --embed $(xdotool getwindowfocus) -d ' . &columns . ' ' . &lines . ' -e $SHELL -c "' . a:shell_command . ' | fzf --ansi --preview ''' . preview . ''' > ' . tempfile . '"')
    let result = system('cat ' . tempfile)

    execute system('rm ' . tempfile)
    execute ':e ' . result
endfunction

nnoremap // :call FzfMagic('fd . --type f --color always')<CR>
