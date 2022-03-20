Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" fuzzy file finder (fzf) bindings
let g:fzf_preview_window = ['right:hidden', 'ctrl-/']
nnoremap <leader>og :GFiles<CR>
nnoremap <leader>of :Files<CR>
nnoremap <leader>ob :Buffers<CR>
nnoremap <leader>or :Rg<CR>
nnoremap <leader>ot :Tags<CR>
nnoremap <leader><space> :b#<CR>
