function! SimpleAutoComplete(is_backwards)
    let directions = ["\<C-n>", "\<C-p>"]
    let indent_directions = ["\<Tab>", "\<C-h>"]
    let direction_index = a:is_backwards ? 1 : 0
    if pumvisible() " if completion menu is visible just cycle through it
        return directions[direction_index]
    endif

    " get the current line as string (excluding empty spaces and tabs)
    let pos = getpos('.') " get cursor position return a list (buff, row, col)
    let substr = matchstr(strpart(getline(pos[1]), 0, pos[2]-1), "[^ \t]*$")

    " Indent/De-indent if current line is empty string
    if empty(substr)
        return indent_directions[direction_index]
    endif

    if match(substr, '\/') != -1 " if the line contains a '/' do file path completion
        return "\<C-x>\<C-f>" . directions[direction_index]
    endif

    return directions[direction_index] " normal completion compl-generic
endfunction

set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
set completeopt=menu,menuone,longest

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent> <expr> <Tab> SimpleAutoComplete(0)
inoremap <silent> <expr> <S-Tab> SimpleAutoComplete(1)
