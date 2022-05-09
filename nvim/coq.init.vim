" 🐓 Coq completion settings

let g:coq_settings = { 'auto_start': v:true }

" Set recommended to false
"let g:coq_settings = { 'keymap.recommended': v:false }
let g:coq_settings = { 'keymap.jump_to_mark': v:null }

" Keybindings
"ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
"ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
"ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
"ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
"ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

