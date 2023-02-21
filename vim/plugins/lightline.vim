Plug 'itchyny/lightline.vim'

" Hack to make light-line appear...
set laststatus=2

" Get rid of default vim mode
set noshowmode

" Light-line configuration
 let g:lightline = {
       \ 'colorscheme': 'powerline',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
       \   'right': [ [ 'lineinfo' ],
       \              [ 'percent' ],
       \              [ 'filetype' ] ]
       \ },
       \ 'component_function': {
       \   'gitbranch': 'FugitiveHead'
       \ },
       \ }
