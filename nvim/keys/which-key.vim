" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


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
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment/uncomment' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'CocExplorer' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['r'] = [ ':Ranger'                    , 'Ranger' ]
let g:which_key_map['t'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['y'] = [ '"+y'                        , 'yank to clipboard' ]
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen mode' ]


" C is for Coc
let g:which_key_map.c = {
      \ 'name' : '+NERDCommenter' ,
      \}

" C is for Coc
let g:which_key_map.C = {
      \ 'name' : '+Coc',
      \ 'e' : [':CocCommand explorer',            'CocExplorer'],
      \ 'l' : [':CocFzfList',                     'CocFzfList'],
      \ 'r' : [':CocFzfListResume',               'CocFzfListResume'],
      \ 'y' : [':CocFzfList yank',                'yanks'],
      \ 'a' : ['<Plug>(coc-codeaction-selected)', 'actions'],
      \}

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ 'w' : [':w',                     'write'],
      \ 'S' : [':w<CR>:so $MYVIMRC<CR>', 'write buffer and source init.vim'],
      \ 'W' : [':wa',                    'write all'],
      \ 'n' : [':vnew',                  'new empty buffer split'],
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
      \ 'name' : '+window' ,
      \ 'd' : [':q'       , 'close'],
      \ 'b' : ['<C-W>s'   , 'split below'],
      \ 'v' : [':vsp'     , 'split right'],
      \ 'j' : ['<C-w>j'   , 'focus below'],
      \ 'k' : ['<C-w>k'   , 'focus above'],
      \ 'h' : ['<C-w>h'   , 'focus left'],
      \ 'l' : ['<C-w>l'   , 'focus right'],
      \}

" Space is for (Easy)motion
let g:which_key_map.m = {
      \ 'name' : '+Easymotion' ,
      \ 'w' : ['w'       , 'word'],
      \}

" n is for NrrwRgn
let g:which_key_map.n = {
      \'name': '+NrrwRgn',
      \ 'r' : [':NRV'      , 'open previous selection in narrow window'],
      \ 'l' : [':NRL'      , 'Reselect the last selected region and open it again in a narrowed window'],
      \}

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 's' : [':G'            , 'status'],
      \ 'b' : [':G blame'      , 'blame'],
      \ 'c' : [':G commit'     , 'commit'],
      \ 'l' : [':G log'        , 'log'],
      \ 'd' : [':G diff'       , 'diff'],
      \ 'D' : [':Gdiffsplit'   , 'diff split'],
      \ 'a' : [':G add'        , 'add'],
      \ 'I' : [':G ai'         , 'interactive add'],
      \ 'r' : [':Gread'        , 'revert uncommited changes'],
      \}

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
