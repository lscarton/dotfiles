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

nnoremap <leader>tj g<C-]>
nnoremap <leader>tn :tnext
nnoremap <leader>tp :tprevious
nnoremap <leader>ct :call GenerateTags()<CR>

if ( isdirectory('.editor') )
    :set tags=.editor/tags
endif
