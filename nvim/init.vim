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
set synmaxcol=128
syntax sync minlines=256

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
Plug 'tpope/vim-fugitive'
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

" IDE stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/NrrwRgn'
Plug 'liuchengxu/vim-which-key'

" End Plugins
call plug#end()

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

set background=dark

let g:onedark_terminal_italics=1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 0
let g:gruvbox_number_column = 'bg0'
let g:gruvbox_sign_column = 'bg0'
let g:palenight_terminal_italics=1
let g:material_theme_style = 'palenight'
let g:material_theme_style = 'dark'

colorscheme palenight

filetype plugin indent on
syntax enable

nmap <leader>e :CocCommand explorer<CR>



" Terminal break to normal remap to ESC
tnoremap <Esc> <C-\><C-n>

" map Ctrl-space to leave insert mode
nnoremap <C-Space> i
inoremap <C-Space> <Esc>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Magic
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

" Vertical split
"nmap <leader>v :vsp<return>
" Write file
"nmap <leader>w :w<return>
" Close/quit
"nmap <leader>q :q<return>

" Movement
"nnoremap <leader>j <C-w>j
"nnoremap <leader>k <C-w>k
"nnoremap <leader>h <C-w>h
"nnoremap <leader>l <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wv :vsp<CR>

nnoremap <leader>bw :w
nnoremap <leader>bc :q

" Map copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" WhichKey
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Search
set rtp+=~/.fzf
nmap <leader>f :Rg<return>
nmap <leader>m :Maps<return>
nmap <leader>p :FZF<CR>
nmap <leader>t :FZF<CR>
nmap <leader>T :Tags<return>

" Clean up all whitespace at the end of lines for the whole file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

let g:gutentags_file_list_command = 'rg --files'

" Lightline config
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'relativepath', 'modified', 'readonly' ] ],
    \   'right': [
    \              [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'linter_warnings', 'linter_errors'],
    \              [ 'filetype' ],
    \            ]
    \ },
    \ 'component_expand': {
    \   'linter_warnings': 'LightlineLinterWarnings',
    \   'linter_errors': 'LightlineLinterErrors',
    \   'linter_ok': 'LightlineLinterOK'
    \ },
    \ 'component_type': {
    \   'readonly': 'error',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error'
    \ },
    \ }

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

" Local config overrides
if !empty(glob("~/.config/init.local.vim"))
  source ~/.config/init.local.vim
end

