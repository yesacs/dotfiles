" fzf {{
nnoremap <C-t> :Files<Cr>
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.6,'yoffset':0.5,'xoffset': 0.5, 'border': 'rounded' } }
hi FZFColor guifg=#555554 guibg=#222222 ctermbg=NONE ctermfg=NONE cterm=NONE
let g:fzf_colors = { 'border': ['fg', 'FZFColor'] }
autocmd FileType fzf set winblend=20
" }}

