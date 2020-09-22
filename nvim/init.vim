" Casey's Nvim Settings
" Usage:
" Download and install nvim, then install 'dein' the vim-package manager.
" During installation of dein it will output a sample configuration, take the
" two lines that `set runtimepath=PATH` and `dein#begin(PATH)` and replace the
" ones in this file, then install FZF

let mapleader = " "
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

set timeoutlen=500
set showmatch
set noswapfile
set noruler
set autowrite
set noshowcmd
set nohlsearch
set ttyfast
set lazyredraw
set nocursorline
"set synmaxcol=128
set number
set numberwidth=5
set textwidth=80
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap
set noshowmode
set hidden
set laststatus=2

filetype plugin indent on

"syntax sync minlines=256
syntax enable

let g:go_version_warning = 0
let g:matchparen_timeout = 10

if has("gui_running")
  set guifont=Fira\ Code\ Retina:h12
  set guioptions=
  set linespace=1
endif

"if &term =~# '^screen'
  "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"end

if &compatible
  set nocompatible               " Be iMproved
endif

" Begin Plugins
call plug#begin('~/.vim/plugged')

"vim compat
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Look'n'feel
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'equalsraf/neovim-gui-shim'
Plug 'jlanzarotta/bufexplorer'
Plug 'miyakogi/conoline.vim'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'

" Lang support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'scrooloose/nerdcommenter'

" Colors
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim'
Plug 'jacoborus/tender.vim'
Plug 'sonph/onehalf'
Plug 'morhetz/gruvbox'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'lifepillar/vim-solarized8'
Plug 'embark-theme/vim', { 'as': 'embark' }

" IDE stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/NrrwRgn'
Plug 'liuchengxu/vim-which-key'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'

" End Plugins
call plug#end()

" Theme
let g:palenight_terminal_italics=1
set background=dark
colorscheme palenight

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

" color fixes for vanilla vim inside alacritty
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"


" Terminal break to normal remap to ESC
tnoremap <Esc> <C-\><C-n>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" C-c closes splits/buffers too
nnoremap <C-c> <C-w><C-c>

" Prettier config
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Set markdown files to 80 char width (???)
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

if (has("nvim"))
  set colorcolumn=+1        " highlight column after 'textwidth'
endif

" vim specific stuff
if !has('gui_running')
  set t_Co=256
endif

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" fzf location
set rtp+=/usr/local/opt/fzf

" Map copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Lightline config
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'relativepath', 'gitbranch', 'modified', 'readonly' ]],
    \   'right': [
    \              [ 'filetype' ],
    \              [ 'percent', 'lineinfo' ],
    \              [ 'linter_warnings', 'linter_errors'],
    \            ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'component_expand': {
    \   'linter_warnings': 'LightlineLinterWarnings',
    \   'linter_errors': 'LightlineLinterErrors',
    \   'linter_ok': 'LightlineLinterOK',
    \ },
    \ 'component_type': {
    \   'readonly': 'error',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \ },
    \ 'colorscheme': 'default',
    \ }

" hello thee

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d', all_errors)
endfunction

" match line number colors to lightline color scheme powerline
let g:conoline_color_normal_dark = 'guibg=#222222'
let g:conoline_color_insert_dark = 'guibg=#222222'

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Disable default Ranger mapping
let g:ranger_map_keys = 0

" WhichKey config
if !empty(glob("~/.config/nvim/keys/which-key.vim"))
  source ~/.config/nvim/keys/which-key.vim
end

" Local config overrides
if !empty(glob("~/.config/init.local.vim"))
  source ~/.config/init.local.vim
end

