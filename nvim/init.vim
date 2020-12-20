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
syntax enable

let g:go_version_warning = 0
let g:matchparen_timeout = 10

if has("gui_running")
  set guifont=Fira\ Code\ Retina:h12
  set guioptions=
  set linespace=1
endif

if &compatible
  set nocompatible " Be iMproved
endif

" Begin Plugins
call plug#begin('~/.vim/plugged')

"vim compat
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Look'n'feel
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'equalsraf/neovim-gui-shim'
Plug 'jlanzarotta/bufexplorer'
Plug 'miyakogi/conoline.vim'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/limelight.vim'

" Lang support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'scrooloose/nerdcommenter'

" Colors
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" IDE stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/NrrwRgn'
Plug 'liuchengxu/vim-which-key'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-fugitive' 
Plug 'antoinemadec/coc-fzf'
Plug 'junegunn/vim-easy-align'
Plug 'voldikss/vim-floaterm'

" End Plugins
call plug#end()

" Theme
set background=dark

let g:material_terminal_italics = 1
let g:palenight_terminal_italics=1

"'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_theme_style = 'palenight'

"colorscheme palenight
"colorscheme one
"colorscheme material
colorscheme onedark

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Lightline config
let g:lightline = {
    \ 'active': {
    \   'left': [ ['mode','paste'],
    \             ['relativepath'],['modified'],['readonly' ]],
    \   'right': [
    \              ['filetype'],
    \              ['lineinfo' ],
    \              ['gitbranch'],
    \              ['linter_warnings','linter_errors'],
    \            ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'component_type': {
    \   'readonly': 'error',
    \ },
    \ 'xcolorscheme': 'material',
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \ }


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

" Disable NrrwRgn default mappings
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1

" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1
" }}

" Coc {{
let g:coc_global_extensions = [
  \'coc-actions',
  \'coc-sh',
  \'coc-css',
  \'coc-json',
  \'coc-tsserver',
  \'coc-prettier',
  \'coc-eslint',
  \'coc-explorer',
  \'coc-yaml',
  \'coc-html',
  \'coc-yank',
  \'coc-xml',
  \'coc-react-refactor',
  \ ]

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" }}

" vim limelight {{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}

" coc-yank {{
"autocmd WinLeave * call coc#util#clear_pos_matches('^HighlightedyankRegion')
" }}

" WhichKey config
if !empty(glob("~/.config/nvim/keys/which-key.vim"))
  source ~/.config/nvim/keys/which-key.vim
end
" Local config overrides
if !empty(glob("~/.config/init.local.vim"))
  source ~/.config/init.local.vim
end

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.6,'yoffset':0.5,'xoffset': 0.5, 'border': 'rounded' } }
hi FZFColor guifg=#555555 guibg=#222222 ctermbg=NONE ctermfg=NONE cterm=NONE
let g:fzf_colors = { 'border': ['fg', 'FZFColor'] }



