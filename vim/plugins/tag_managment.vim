function! GenerateTags()
    " create .editor directory if it does not exist
    if ( !isdirectory('.editor') )
        :call system('mkdir .editor && echo ".editor/*" >> .gitignore')
    endif

    " remove existing tags file
    :call system('rm .editor/tags')

    " create ctags_dep_list file if it does not exist
    if ( !filereadable('.editor/ctags_dep_list') )
        let cwd = getcwd()
        :call writefile([cwd], '.editor/ctags_dep_list')
    endif

    " generate new tags
    :call system('ctags -o .editor/tags -L .editor/ctags_dep_list')
    :set tags=.editor/tags
    echom "Updated Tags!"
endfunction

" nnoremap <leader>tj g<C-]>
nnoremap <leader>tj :call fzf#vim#tags('^' . expand('<cword>') . ' ', {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <leader>tgd :call fzf#vim#tags('^' . expand('<cword>') . ' .h ', {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <leader>tgf :call fzf#vim#tags('^' . expand('<cword>') . ' .cpp ', {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <leader>tn :tnext<CR>
nnoremap <leader>tp :tprevious<CR>
nnoremap <leader>tu :call GenerateTags()<CR>

if ( isdirectory('.editor') )
    :set tags=.editor/tags
endif
