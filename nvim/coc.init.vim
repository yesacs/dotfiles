" Coc {{

" Prettier config
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" " Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = [
  \'coc-actions',
  \'coc-sh',
  \'coc-css',
  \'coc-json',
  \'coc-tsserver',
  \'coc-conjure',
  \'coc-prettier',
  \'coc-eslint',
  \'coc-explorer',
  \'coc-yaml',
  \'coc-html',
  \'coc-yank',
  \'coc-xml',
  \'coc-react-refactor',
  \'coc-diagnostic'
  \ ]

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" }}

" coc-explorer {{
hi CocExplorerNormalFloat guibg=None
hi CocExplorerNormalFloatBorder guibg=None

autocmd FileType coc-explorer set winblend=20
autocmd FileType coc-explorer-border set winblend=20

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 70,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 70,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}],
\     'position': 'floating',
\     'floating-position': 'center',
\     'open-action-strategy': 'select',
\     'floating-width': 140,
\     'floating-height': 40,
\   },
\ }
" }}
