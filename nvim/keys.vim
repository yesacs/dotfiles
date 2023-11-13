map <leader>W :WhichKey<CR>

" space-p
map <leader>pf :Telescope find_files<CR>
map <leader>pr :Neotree float reveal<CR>

" space-b
map <leader>bb :Telescope buffers<CR>
map <leader>bl <C-o>

" space-f
map <leader>fp :Telescope find_files<CR>
map <leader>fr :Telescope lsp_references<CR>
map <leader>fs :Telescope lsp_docuemnt_symbols<CR>
map <leader>fg :GFiles<CR>
map <leader>fG :GFiles?<CR>
map <leader>fb :Buffers<CR>
map <leader>fF :Rg<CR>
map <leader>ff :Telescope live_grep<CR>
map <leader>fa :Ag<CR>
map <leader>fl :Lines<CR>
map <leader>fL :BLines<CR>

" space-o
map <leader>op :Neotree float toggle=true<CR>
map <leader>oP :Neotree toggle=true<CR>

" space-a
map <leader>aa <Plug>(EasyAlign)><CR>
map <leader>ap <Plug>(EasyAlign)ip<CR>

" space-w
map <leader>wh <C-h>
map <leader>wj <C-j>
map <leader>wk <C-k>
map <leader>wl <C-l>
map <leader>wv :vsp<CR>
map <leader>wd :q<CR>

" space
map <leader>T :TroubleToggle<CR>
map <leader>L :Limelight!!<CR>
map <leader>S :setlocal spell! spelllang=en_us<CR>
map <leader>M :MarkdownPreviewToggle<CR>
map <leader>Z :Goyo<CR>

" space-r
map <leader>rr <Plug>SlimeRegionSend<CR>
map <leader>rs <Plug>SlimeRegionSend<CR>
map <leader>rp <Plug>SlimeParagraphSend<CR>
map <leader>rc <Plug>SlimeConfig<CR>

" space-g
map <leader>gs :G<CR>
map <leader>gb :G blame<CR>
map <leader>gc :G commit<CR>
map <leader>gl :G log<CR>
map <leader>gd :G diff<CR>
map <leader>gD :Gdiffsplit<CR>
map <leader>ga :G add<CR>
map <leader>gI :G ai<CR>
map <leader>gr :Gread<CR>

" space-m
map <leader>ml <Plug>(easymotion-bd-jk)<CR>
map <leader>mw <Plug>(easymotion-bd-w)<CR>
map <leader>me <Plug>(easymotion-bd-e)<CR>
map <leader>mf <Plug>(easymotion-bd-f)<CR>
map <leader>mW <Plug>(easymotion-overwin-w)<CR>
map <leader>mL <Plug>(easymotion-overwin-line)<CR>
map <leader>mF <Plug>(easymotion-overwin-f)<CR>

" space-N
map <leader>nr :NRV<CR>
map <leader>nl :NRL<CR>

