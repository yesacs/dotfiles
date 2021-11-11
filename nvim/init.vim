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
set clipboard=unnamed
set list listchars=tab:»\ ,trail:·,nbsp:⎵,precedes:<,extends:>

syntax enable

let g:go_version_warning = 0
let g:matchparen_timeout = 10

if has("gui_running")
  set guifont=Fira\ Code\ Retina:h10
  set guioptions=
  set linespace=1
endif

if &compatible
  set nocompatible " Be iMproved
endif

" Begin Plugins
call plug#begin('~/.vim/plugged')

" Color
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'kyazdani42/nvim-palenight.lua'
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
"Plug 'drewtempelmeyer/palenight.vim'

"vim compat
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Look'n'feel
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'equalsraf/neovim-gui-shim'
Plug 'miyakogi/conoline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mhinz/vim-startify'

" Status lines
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

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
Plug 'neovim/nvim-lspconfig'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/NrrwRgn'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-fugitive' 
Plug 'junegunn/vim-easy-align'
Plug 'voldikss/vim-floaterm'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'jpalardy/vim-slime'
Plug 'liuchengxu/vim-which-key'
"Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'Olical/conjure'
Plug 'Olical/aniseed'
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-sexp'

" Coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'antoinemadec/coc-fzf'

" NVIM LSP
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" End Plugins
call plug#end()

source ~/.config/nvim/colorscheme.init.vim

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
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
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Disable NrrwRgn default mappings
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1

" Format on save
"autocmd BufWritePre *.js Neoformat
"autocmd BufWritePre *.jsx Neoformat
"autocmd BufWritePre *.scss Neoformat
"autocmd BufWritePre *.css Neoformat

nmap <Leader>P <Plug>(Prettier)
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_async = 1

source ~/.config/nvim/limelight.init.vim
source ~/.config/nvim/lightline.init.vim
source ~/.config/nvim/slime.init.vim
source ~/.config/nvim/fzf.init.vim
source ~/.config/nvim/clojure.init.vim
source ~/.config/nvim/keys/which-key.vim

let g:coq_settings = { 'auto_start': v:true }

lua << END
require'lspconfig'.tsserver.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.clojure_lsp.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require('lsp_conf')
require('evil_lualine')
require('nvimtree')
END


" Local config overrides
if !empty(glob("~/.config/init.local.vim"))
  source ~/.config/init.local.vim
end

