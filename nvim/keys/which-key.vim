" Map leader to which_key
"nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
"vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR> 

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

" Create map to add keys to 
let g:which_key_map =  {} 

"Define a separator 
let g:which_key_sep = '→' 
set timeoutlen=1000

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle', 'comment/uncomment' ]
let g:which_key_map['e'] = [ ':CocCommand explorer',      'CocExplorer' ]
let g:which_key_map['t'] = [ ':Files',                    'search files' ]
let g:which_key_map['p'] = [ ':Files',                    'search files' ]
let g:which_key_map['h'] = [ '<C-W>s',                    'split below']
let g:which_key_map['r'] = [ ':Ranger',                   'Ranger' ]
let g:which_key_map['f'] = [ ':Rg',                       'search text' ]
let g:which_key_map['l'] = [ ':Limelight!!',              'Limelight' ]
let g:which_key_map['v'] = [ '<C-W>v',                    'split right']
let g:which_key_map['y'] = [ '"+y',                       'yank to clipboard' ]
let g:which_key_map['z'] = [ 'Goyo',                      'zen mode' ]

" a is for EasyAlign
let g:which_key_map.a = {
      \ 'name' : '+align' ,
      \ 'a' : ['<Plug>(EasyAlign)>', 'line'],
      \ 'p' : ['<Plug>(EasyAlign)ip', 'in-paragraph'],
      \}

" p is for vim-plug
let g:which_key_map.p = {
      \ 'name' : '+plug',
      \ 'i' : [':PlugInstall', 'PlugInstall'],
      \ 'c' : [':PlugClean',   'PlugClean'],
      \ 'u' : [':PlugUpgrade', 'PlugUpgrade  '],
      \}

" C is for Coc
let g:which_key_map.c = {
      \ 'name' : '+NERDCommenter' ,
      \}

" , is for Coc
let g:which_key_local_map = {
      \ 'name' : '+Coc',
      \ 'e' : [':CocCommand explorer',            'CocExplorer'],
      \ 'l' : [':CocFzfList',                     'CocFzfList'],
      \ 'h' : [':call CocActionAsync("doHover")', 'show-docs'],
      \ 'd' : ['<Plug>(coc-definition)',          'definition'],
      \ 'g':{
          \ 'name' : '+goto',
          \ 'd' : ['<Plug>(coc-definition)',          'goto-definition'],
          \ 't' : ['<Plug>(coc-type-definition)',     'goto-type-definition'],
          \ 'i' : ['<Plug>(coc-implementation)',      'goto-implementation'],
      \},
      \ 'R' : ['<Plug>(coc-references)',          'show-uses'],
      \ 'r' : ['<Plug>(coc-rename)',              'rename'],
      \ 'a' : ['<Plug>(coc-codeaction)',          'actions'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)', 'actions-for-selection'],
      \}

let g:which_key_map[','] = g:which_key_local_map

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ 'w' : [':w',                           'write'],
      \ 'S' : [':w<CR>:source $MYVIMRC<CR>', 'write buffer and source init.vim'],
      \ 'W' : [':wa',                          'write all'],
      \ 'n' : [':vnew',                        'new empty buffer split'],
      \}

" q is for quit
let g:which_key_map.q = {
      \ 'name' : '+quit' ,
      \ 'w' : [':wq'     , 'write and quit'],
      \ 'W' : [':wqa'    , 'write all and quit'],
      \ 'q' : [':qa'     , 'quit all'],
      \ 'Q' : [':qa!'    , 'scuttle all and quit'],
      \}

" w is for window
let g:which_key_map.w = {
      \ 'name' : '+window',
      \ 'd' : [':q',        'close'],
      \ 'q' : [':wq',       'save and close'],
      \ 'b' : ['<C-W>s',    'split-below'],
      \ 'v' : [':vsp',      'split-right'],
      \ 'j' : ['<C-w>j',    'focus-below'],
      \ 'k' : ['<C-w>k',    'focus-above'],
      \ 'h' : ['<C-w>h',    'focus-left'],
      \ 'l' : ['<C-w>l',    'focus-right'],
      \}

" Space is for (Easy)Motion
let g:which_key_map.m = {
      \ 'name' : '+motion',
      \ 'l' : ['<Plug>(easymotion-bd-jk)',        'line'],
      \ 'w' : ['<Plug>(easymotion-bd-w)',         'word'],
      \ 'e' : ['<Plug>(easymotion-bd-e)',         'word end'],
      \ 'W' : ['<Plug>(easymotion-overwin-w)',    'word (overwin)'],
      \ 'L' : ['<Plug>(easymotion-overwin-line)', 'line (overwin)'],
      \ 's' : ['<Plug>(easymotion-bd-f)',         'search'],
      \ 'S' : ['<Plug>(easymotion-overwin-f)',    'search (overwin)'],
      \}

" n is for NrrwRgn
let g:which_key_map.n = {
      \ 'name': '+NrrwRgn',
      \ 'r' : [':NRV',      'open previous selection in narrow window'],
      \ 'l' : [':NRL',      'Reselect the last selected region and open it again in a narrowed window'],
      \}

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 's' : [':G',          'status'],
      \ 'b' : [':G blame',    'blame'],
      \ 'c' : [':G commit',   'commit'],
      \ 'l' : [':G log',      'log'],
      \ 'd' : [':G diff',     'diff'],
      \ 'D' : [':Gdiffsplit', 'diff split'],
      \ 'a' : [':G add',      'add'],
      \ 'I' : [':G ai',       'interactive add'],
      \ 'r' : [':Gread',      'revert uncommited changes'],
      \}

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search',
      \ '/' : [':History/',        'history'],
      \ ';' : [':Commands',        'commands'],
      \ 'a' : [':Ag',              'text Ag'],
      \ 'b' : [':BLines',          'current buffer'],
      \ 'B' : [':Buffers',         'open buffers'],
      \ 'c' : [':Commits',         'commits'],
      \ 'C' : [':BCommits',        'buffer commits'],
      \ 'f' : [':Files',           'files'],
      \ 'g' : [':GFiles',          'git files'],
      \ 'G' : [':GFiles?',         'modified git files'],
      \ 'h' : [':History',         'file history'],
      \ 'H' : [':History:',        'command history'],
      \ 'l' : [':Lines',           'lines'] ,
      \ 'm' : [':Marks',           'marks'] ,
      \ 'M' : [':Maps',            'normal maps'] ,
      \ 'p' : [':Helptags',        'help tags'] ,
      \ 'P' : [':Tags',            'project tags'],
      \ 's' : [':Snippets',        'snippets'],
      \ 'S' : [':Colors',          'color schemes'],
      \ 't' : [':Rg',              'text Rg'],
      \ 'T' : [':BTags',           'buffer tags'],
      \ 'w' : [':Windows',         'search windows'],
      \ 'Y' : [':Filetypes',       'file types'],
      \ 'z' : [':FZF',             'FZF'],
      \ 'y' : [':CocFzfList yank', 'yanks'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
call which_key#register(',', "g:which_key_local_map")
