" Map leader to which_key
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

let g:which_key_vertical = 0 
let g:which_key_centered = 0 

" Create map to add keys to 
let g:which_key_map =  {} 

"Define a separator 
let g:which_key_sep = '→' 
set timeoutlen=500

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
"let g:which_key_map['t'] = [ ':Files',                           ':Files' ]
let g:which_key_map['T'] = [ ':FloatermToggle',                  'Floaterm' ]
let g:which_key_map['L'] = [ ':Limelight!!',                     'Limelight' ]
let g:which_key_map['S'] = [ ':setlocal spell! spelllang=en_us', 'Spell check (en_us)' ]
let g:which_key_map['M'] = [ ':MarkdownPreviewToggle',           'Markdown Preview' ]
let g:which_key_map['Z'] = [ 'Goyo',                             'zen mode' ]

" a is for EasyAlign
let g:which_key_map.a = {
      \ 'name' : '+align',
      \ 'a' : ['<Plug>(EasyAlign)>',  'line'],
      \ 'p' : ['<Plug>(EasyAlign)ip', 'in-paragraph'],
      \}

" n is for NvimTree  
let g:which_key_map.n = {
      \ 'name' : '+NvimTree',
      \ 'n' : [ ':NvimTreeToggle',   'NvimTreeToggle' ],
      \ 'f' : [ ':NvimTreeFindFile', 'NvimTreeFindFile' ],
      \ 'r' : [ ':NvimTreeRefresh',  'NvimTreeRefresh' ],
      \}

" f is for fzf 
let g:which_key_map.Q = {
      \ 'name' : '+FZF',
      \ 'p' : [':Files',    'Files'],
      \ 'g' : [':GFiles',   'Git ls-files'],
      \ 'G' : [':GFiles?',  'Git Files'],
      \ 'b' : [':Buffers',  'Buffers'],
      \ 'f' : [':Rg',       'Rg'],
      \ 'a' : [':Ag',       'Ag'],
      \ 'l' : [':Lines',    'Lines in open Buffers'],
      \ 'L' : [':BLines',   'Lines in current Buffer'],
      \ 't' : [':Tags',     'Tags in open Buffers'],
      \ 'T' : [':Tags',     'Tags in current Buffer'],
      \ 'm' : [':Marks',    'Marks'],
      \ 'w' : [':Windows',  'Windows'],
      \ 'h' : [':History',  'History'],
      \ 'H' : [':History:', 'Command History'],
      \ 'S' : [':History/', 'Search History'],
      \ 's' : [':Snippets', 'Snippets'],
      \ 'c' : [':Commits',  'Commits'],
      \ 'C' : [':BCommits', 'Commits for current Buffers'],
      \ 'z' : [':Commands', 'Commands'],
      \}

" p is for project
let g:which_key_map.p = {
      \ 'name' : '+project',
      \ 'f' : [':Telescope find_files', 'Find files in project'],
      \ 's' : [':Rg',       'Search in Project'],
      \}

" P is for vim-plug
let g:which_key_map.P = {
      \ 'name' : '+plug',
      \ 'i' : [':PlugInstall', 'PlugInstall'],
      \ 'c' : [':PlugClean',   'PlugClean'],
      \ 'u' : [':PlugUpdate',  'PlugUpdate'],
      \ 'U' : [':PlugUpgrade', 'PlugUpgrade'],
      \}

" C is for NERDCommenter
let g:which_key_map.c = {
      \ 'name' : '+NERDCommenter' ,
      \}

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ 'W' : [':wa',                                   'write all'],
      \ 'w' : [':w',                                    'write buffer'],
      \ 'b' : [':Buffers',                              ':Buffers'],
      \ 'S' : [':w<CR>:source $MYVIMRC<CR>',            'write buffer and source init.vim'],
      \ 'n' : [':vnew',                                 'new empty buffer split'],
      \ 'd' : [ ':Blose',                               'Delete Buffer' ],
      \ 'D' : [ ':Blose!',                              'Delete Buffer (Force)' ],
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
      \ 'd' : [':close',    'close'],
      \ 'q' : [':wq',       'save and close'],
      \ 'v' : [':vsp',      'split-right'],
      \ 'b' : ['<C-w>s',    'split-below'],
      \ 'h' : ['<C-w>h',    'focus-left'],
      \ 'j' : ['<C-w>j',    'focus-below'],
      \ 'k' : ['<C-w>k',    'focus-above'],
      \ 'l' : ['<C-w>l',    'focus-right'],
      \}

" m is for (Easy)Motion
let g:which_key_map.m = {
      \ 'name' : '+EasyMotion',
      \ 'l' : ['<Plug>(easymotion-bd-jk)',        'line'],
      \ 'w' : ['<Plug>(easymotion-bd-w)',         'word'],
      \ 'e' : ['<Plug>(easymotion-bd-e)',         'word end'],
      \ 'f' : ['<Plug>(easymotion-bd-f)',         'search'],
      \ 'W' : ['<Plug>(easymotion-overwin-w)',    'word (overwin)'],
      \ 'L' : ['<Plug>(easymotion-overwin-line)', 'line (overwin)'],
      \ 'F' : ['<Plug>(easymotion-overwin-f)',    'search (overwin)'],
      \}

" N is for NrrwRgn
let g:which_key_map.N = {
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
      \ }

" R is for repl
let g:which_key_map.R = {
     \ 'name' : '+reply',
     \ 'n' : [':Repl',             'Open New REPL'],
     \ 'q' : [':ReplStop',         'Kill Active REPL'],
     \ 'r' : [":'<,'>ReplSend",    'Send selection to REPL'],
     \ }

" e is for Conjure(Eval) (WIP)
let g:which_key_map.e = {
     \ 'name' : '+ConjureEval',
     \ "'" : [':Clj',                    'jack in'],
     \ 'e' : [':ConjureEval',            'eval'],
     \ 'b' : [':ConjureEvalBuf',         'Buf'],
     \ 'f' : [':ConjureEvalCurrentForm', 'Current Form'],
     \ 'r' : [':ConjureEvalRootForm',    'Root Form'],
     \ 'm' : [':ConjureEvalMarkedForm',  'Marked Form'],
     \ 'v' : [':ConjureEvalVisual',      'Visual'],
     \ 'w' : [':ConjureEvalWord',        'Word'],
     \ 'F' : [':ConjureEvalFile',        'File'],
     \ 'c' :{
        \ 'name': '+ConjureEvalComment',
        \ 'f' : [':ConjureEvalCommentCurrentForm', 'Current Form'],
        \ 'r' : [':ConjureEvalCommentRootForm',    'Root Form'],
        \ 'm' : [':ConjureEvalCommentMarkedForm',  'Marked Form'],
        \ }
     \ }

" , is for Coc
let g:which_key_local_map = {
      \ 'name' : '+Coc',
      \ ',' : [':CocCommand',                                'CocCommand'],
      \ 'e':{
          \ 'name' : '+CocExplore',
          \ 'b' : [':CocCommand explorer --preset buffer',   'buffers' ],
          \ 'f' : [':CocCommand explorer --preset floating', 'Left-side floater' ],
          \ 'e' : [':CocCommand explorer',                   'CocExplorer'],
      \},
      \ 'l' : [':CocFzfList',                                'CocFzfList'],
      \ 'h' : [':call CocActionAsync("doHover")',            'show-docs'],
      \ 'd' : ['<Plug>(coc-definition)',                     'definition'],
      \ 'g':{
          \ 'name' : '+goto',
          \ 'd' : ['<Plug>(coc-definition)',                 'goto-definition'],
          \ 't' : ['<Plug>(coc-type-definition)',            'goto-type-definition'],
          \ 'i' : ['<Plug>(coc-implementation)',             'goto-implementation'],
      \},
      \ 'R' : ['<Plug>(coc-references)',                     'show-uses'],
      \ 'r' : ['<Plug>(coc-rename)',                         'rename'],
      \ 'a' : ['<Plug>(coc-codeaction)',                     'actions'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)',            'actions-for-selection'],
      \}

" r is for REPL (slime)
let g:which_key_map.r = {
     \ 'name' : '+Slime',
     \ 'r' : ['<Plug>SlimeRegionSend',    'SlimeRegionSend'],
     \ 's' : ['<Plug>SlimeRegionSend',    'SlimeRegionSend'],
     \ 'p' : ['<Plug>SlimeParagraphSend', 'SlimeParagraphSend'],
     \ 'c' : ['<Plug>SlimeConfig',        'SlimeConfig'],
     \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
"call which_key#register(',', "g:which_key_local_map")
