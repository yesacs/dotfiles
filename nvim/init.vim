" Casey's Nvim Settings
" Usage:
" Download and install nvim, then install 'dein' the vim-package manager.
" During installation of dein it will output a sample configuration, take the
" two lines that `set runtimepath=PATH` and `dein#begin(PATH)` and replace the
" ones in this file, then install FZF

let mapleader = " "

set showmatch
set noswapfile
set noruler
set autowrite
set noshowcmd
set nohlsearch

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

"vim compat
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')

" Look'n'feel
call dein#add('airblade/vim-gitgutter')
call dein#add('junegunn/fzf', {'build': '~/.fzf/install --all'})
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
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('junegunn/goyo.vim')

" Lang support
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('scrooloose/nerdcommenter')

" Colors
call dein#add('joshdick/onedark.vim')
call dein#add('kaicataldo/material.vim')
call dein#add('rakr/vim-one')
call dein#add('drewtempelmeyer/palenight.vim')
call dein#add('dracula/vim')
call dein#add('jacoborus/tender.vim')
call dein#add('sonph/onehalf')
call dein#add('morhetz/gruvbox')
call dein#add('cocopon/lightline-hybrid.vim')
call dein#add('tomasr/molokai')
call dein#add('sickill/vim-monokai')
call dein#add('lifepillar/vim-solarized8')

" Deoplete (autocomplete) & other shitty IDE-like behaviour
call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'})
call dein#add('chrisbra/NrrwRgn')

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

" color fixes for vanilla vim inside alacritty
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

let g:onedark_terminal_italics=1 
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 0
let g:gruvbox_number_column = 'bg0'
let g:gruvbox_sign_column = 'bg0'
let g:palenight_terminal_italics=1

let g:material_theme_style = 'palenight'
"let g:material_theme_style = 'dark'

set background=dark
"set background=light

"colorscheme one
"colorscheme onedark
"colorscheme palenight
"colorscheme material
"colorscheme gruvbox
colorscheme dracula
"colorscheme molokai
"colorscheme monokai
"colorscheme solarized8

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
let g:vimfiler_as_default_explorer = 1

"map <leader>n :NERDTreeToggle<CR>
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

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Activate line-numbers eveywhere
set number
set numberwidth=5
"
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

autocmd BufRead,BufNewFile *.md setlocal textwidth=80

"if (has("nvim"))
  "set colorcolumn=+1        " highlight column after 'textwidth'
"endif

set noshowmode
set textwidth=80

"buffers --------------------
set hidden

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
" vim-tmux-navigator handles these now, there is tmux conf too
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w><C-c>

nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>c <C-w><C-c>

nmap <leader>v :vsp<return>
nmap <leader>w :w<return>
nmap <leader>q :q<return>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

"search
set rtp+=~/.fzf
nmap <leader>f :Rg<return>
nmap <leader>T :Tags<return>

let g:gutentags_file_list_command = 'rg --files'

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

"let g:lightline.colorscheme = 'onedark'
"let g:lightline.colorscheme = 'tender'
"let g:lightline.colorscheme = 'hybrid'
"let g:lightline.colorscheme = 'wombat'
"let g:lightline.colorscheme = 'one'
"let g:lightline.colorscheme = 'gruvbox'
"let g:lightline.colorscheme = 'material'
"let g:lightline.colorscheme = 'material_vim'
"let g:lightline.colorscheme = 'dracula'
"let g:lightline.colorscheme = 'PaperColor'

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

" match line number colors to lightline color scheme
" powerline
let g:conoline_color_normal_dark = 'guibg=#222222'
let g:conoline_color_insert_dark = 'guibg=#222222'

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


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

if !empty(glob("~/.config/init.local.vim"))
  source ~/.config/init.local.vim
end

