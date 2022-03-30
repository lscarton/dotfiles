function! IterativeFind(file_path, filename)
    let itr = 0
    let itr_limit = 5
    let search_path = a:file_path
    while itr < itr_limit
        let itr += 1
        let search_path = simplify(search_path . '/..')
        let answer = split(globpath(search_path, '**/' . a:filename), '\n')
        if len(answer) > 0
            return answer[0]
        endif
    endwhile
    return
endfunction

function! SwitchSourceHeader()
    let file_extension = expand('%:e')
    let file_name = expand('%:t:r')
    let file_path = expand('%:p:h')
    let other_file_name = ''
    if ( file_extension == 'cpp')
        let other_file_name = file_name . '.h'
    elseif ( file_extension == 'h' )
        let other_file_name = file_name . '.cpp'
    else
        echom 'Switching does not support .' . file_extension
        return
    endif
    let other_file_path = IterativeFind(file_path, other_file_name)
    if empty(other_file_path)
        echom 'Could not find ' . other_file_name
        return
    endif
    execute 'edit' other_file_path
endfunction

nnoremap <leader>os :call SwitchSourceHeader()<CR>
