" Casey's Nvim Settings
" Usage:
" Download and install nvim, then install 'dein' the vim-package manager.
" During installation of dein it will output a sample configuration, take the
" two lines that `set runtimepath=PATH` and `dein#begin(PATH)` and replace the
" ones in this file, then install FZF

let mapleader = " "

set showmatch
set noswapfile
set ruler
set autowrite

let g:matchparen_timeout = 10 

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.config/nvim/')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Look'n'feel
call dein#add('scrooloose/nerdtree')
call dein#add('airblade/vim-gitgutter')
call dein#add('junegunn/fzf')
call dein#add('junegunn/fzf.vim')
call dein#add('mhinz/vim-startify')
call dein#add('equalsraf/neovim-gui-shim')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('miyakogi/conoline.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('wincent/ferret')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-surround')

" Lang support
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('scrooloose/nerdcommenter')
call dein#add('w0rp/ale')

" Colors
call dein#add('joshdick/onedark.vim')
call dein#add('kaicataldo/material.vim')
call dein#add('rakr/vim-one')
call dein#add('drewtempelmeyer/palenight.vim')

" Deoplete (autocomplete) & other shitty IDE-like behaviour
"if (has("nvim"))
 call dein#add('Shougo/deoplete.nvim')
"endif

call dein#add('Shougo/neoinclude.vim')
call dein#add('Shougo/context_filetype.vim')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme onedark

let g:onedark_terminal_italics=1 

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Configure deoplete and subcandidates
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#clang#libclang_path="/usr/lib/llvm-4.0/lib/libclang.so"
let g:deoplete#sources#clang#clang_header="/usr/include/clang"
" Let auto-complete take effect on TAB key
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
    function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}
" Close any automatically opened scratch-buffers 
" once completion popup the is closed
autocmd CompleteDone * pclose

map <leader>n :NERDTreeToggle<CR>
map <leader>e :Explore<CR>
map <C-p> :FZF<CR>
map <leader>p :FZF<CR>
map <leader>t :FZF<CR>

" Configure tabs to be 2-spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap

" Terminal break to normal remap to ESC
tnoremap <Esc> <C-\><C-n>

" map Ctrl-space to leave insert mode
nnoremap <C-Space> i
inoremap <C-Space> <Esc>

" Activate line-numbers eveywhere
set number
set numberwidth=5
set relativenumber

let g:ale_fix_on_save = 1
let g:ale_fixers = ['prettier', 'eslint']

autocmd BufRead,BufNewFile *.md setlocal textwidth=80

set textwidth=80
set colorcolumn=+1        " highlight column after 'textwidth'
set noshowmode

"buffers --------------------
set hidden

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w><C-c>

"search
nmap <leader>f :Ack 
nmap <leader>l :Lack 

set ttyfast
set lazyredraw
set nocursorline
set synmaxcol=128
syntax sync minlines=256

let g:go_version_warning = 0

" Lightline config
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'absolutepath', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'filetype' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

"let g:lightline.colorscheme = 'onedark'
"let g:lightline.colorscheme = 'powerline'

"fzf 
set rtp+=/usr/local/opt/fzf

" Map copy to system clipboard to be a little more finger friendly
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Clean up all whitespace at the end of lines for the whole file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>


" vim specific stuff
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
