nnoremap <leader>TT :set termwinsize&<CR>:terminal<CR>
nnoremap <leader>Tb :set termwinsize=20*200<CR>:terminal bash -x .editor/build_cmd<CR>
nnoremap <leader>Tt :terminal bash -x .editor/test_cmd<CR>

" find cmake errors and warning
nnoremap <leader>Te /\v(.+)\/\zs([^\/]+)\.(h\|cpp)\ze:\d+:\d+: (fatal error\|error\|warning):<CR>

nnoremap <leader>cbt :terminal bash -c "catkin build --this"<CR>
