Plug 'itchyny/lightline.vim'

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

