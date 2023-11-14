" Casey's Nvim Settings
" Usage:
" Download and install nvim, then install 'dein' the vim-package manager.
" During installation of dein it will output a sample configuration, take the
" two lines that `set runtimepath=PATH` and `dein#begin(PATH)` and replace the
" ones in this file, then install FZF

let mapleader = "\<Space> "
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

set timeoutlen=500
set showmatch
set noswapfile
set noruler
set autowrite
set noshowcmd
set nohlsearch
set ttyfast 
set lazyredraw 
set cursorline
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
set clipboard=unnamed
set list listchars=tab:»\ ,trail:·,nbsp:⎵,precedes:<,extends:>

set wildmenu
set wildmode=longest:list,full

syntax enable

let g:go_version_warning = 0
let g:matchparen_timeout = 10

" Begin Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Color
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'dracula/vim'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'
Plug 'sainnhe/gruvbox-material'
Plug 'ghifarit53/tokyonight-vim'
Plug 'jacoborus/tender.vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'catppuccin/nvim'
Plug 'loctvl842/monokai-pro.nvim'

"vim compat
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Look'n'feel
Plug 'tpope/vim-repeat'
Plug 'equalsraf/neovim-gui-shim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mhinz/vim-startify'

" Status lines
Plug 'nvim-lualine/lualine.nvim'

" Lang support
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'scrooloose/nerdcommenter'
Plug 'fladson/vim-kitty'

" IDE stuff
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/NrrwRgn'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-fugitive' 
Plug 'junegunn/vim-easy-align'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'jpalardy/vim-slime'
Plug 'folke/which-key.nvim'
Plug 'benwainwright/fzf-project'
Plug 'David-Kunz/jester'
Plug 'vim-test/vim-test'

Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'gelguy/wilder.nvim'

" Tree Stuff
Plug 'MunifTanjim/nui.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 't9md/vim-choosewin'

" Clojure
Plug 'Olical/conjure'
Plug 'clojure-vim/vim-jack-in'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-sexp'

" NVIM LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
"Plug 'prettier/vim-prettier'

" cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'

" Treesitter is auto installed with brew version of nvim
Plug 'nvim-treesitter/nvim-treesitter'

" ORG mode
Plug 'nvim-orgmode/orgmode'

" End Plugins
call plug#end()

source ~/.config/nvim/colorscheme.init.vim

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has('termguicolors'))
  set termguicolors
endif

" Terminal break to normal remap to ESC
tnoremap <Esc> <C-\><C-n>

" Set markdown files to 80 char width (???)
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" match line number colors to lightline color scheme powerline
let g:conoline_color_normal_dark = 'guibg=#222222'
let g:conoline_color_insert_dark = 'guibg=#222222'

" Jump to the last position when reopening a file
if has('autocmd')
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Disable NrrwRgn default mappings
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1

let g:conjure#log#hud#enabled = 0

" gd open in split
nnoremap gv :vertical dsplit <C-R><C-w><cr>

"call wilder#setup({'modes': [':', '/', '?']})

source ~/.config/nvim/keys.vim
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

lua << END
--require('nvim-lsp')
require('lsp_conf_cmp')
require('null_ls')
require('orgmode').setup_ts_grammar()
require('evil_lualine')
require("which-key").setup {}
END

source ~/.config/nvim/limelight.init.vim
source ~/.config/nvim/slime.init.vim
source ~/.config/nvim/fzf.init.vim
source ~/.config/nvim/clojure.init.vim

" Local config overrides
if !empty(glob('~/.config/init.local.vim'))
  source ~/.config/init.local.vim

endif

