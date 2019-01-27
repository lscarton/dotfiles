" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation fetches from;
" https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'dylanaraps/wal.vim'
call plug#end()

" Call color scheme
" colo molokai
" let g:molokai_original=0
" color new_theme
colorscheme wal

" my mappings
:command! W w
:command! Q q
:command! WQ wq
:command! Wq wq
:command! YCMoff let g:ycm_auto_trigger=0
:command! ST SyntasticToggleMode
:command! Label VimtexLabelsOpen
:command! Png normal $<C-v>G$hA.png<esc>

" mapping Tab and Shift+Tab to move among tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" disable scroll using mouse
set mouse=a
nmap <ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
imap <ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
vmap <ScrollWheelUp> <nop>
vmap <ScrollWheelDown> <nop>

" setting to keep cursor line in middle
set scrolloff=5

"filetype plugin indent on
filetype plugin on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Run current script in python with F5
nnoremap <F5> :! python %<cr>

" Set spell check"
" set spell spelllang=en_us

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Copy in the clipboard
vnoremap <C-c> "+y
vnoremap <C-v> "+p

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Automatic recompiling of st config.h
autocmd bufwritepost ~/st-0.8.1/config.h !sudo make install

" Comment lines or blocks
noremap <leader>] :Commentary<cr>

" Enable syntax highlighting
syntax enable

" make hidden characters like tabs or EOL visible
set listchars=nbsp:_,trail:.,tab:▸\ ,eol:¬
" set list

" disable auto-commenting when entering new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enter the current millenium
set nocompatible

" wildmenu for fuzzy file finding
set wildmenu

" disable wrapping the lines
set nowrap

set foldmethod=indent  " Default fold method
" set the method for folding depending on language
autocmd FileType c,cpp,java,scala set foldmethod=syntax
autocmd FileType sh,ruby,python   set foldmethod=indent
set foldmethod=indent   
" level of nesting to fold
set foldnestmax=10
"set nofoldenable
set foldlevel=10

" Show line numbers
set number

" relative line numbering
set rnu

" Set tabs width to 4, it is still \t
set tabstop=4
" Set shiftwidth to 0 which makes it equal to tabwidth by default. This is
" needed to use proper indentation
set shiftwidth=0

" Expand tabs into spaces
set expandtab

" Indent when moving to the next line while writing code
set autoindent

" Show the matching part of the pair for [] {} and ()
set showmatch

" setting smart indentation
set smartindent

" Enable all Python syntax highlighting features
"let python_highlight_all = 1

" Mouse click
" set mouse=a

" Show a visual line under the cursor's current line
" set cursorline

" Easier indentation of code blocks
" In visual mode (v), select several lines of code press ``>`` several times.
vnoremap < <gv
vnoremap > >gv

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Hack to make light-line appear...
set laststatus=2

" Get rid of default vim mode
set noshowmode

" Eliminate delay between INSERT and ESCAPE
set timeoutlen=1000 ttimeoutlen=0

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
       \   'gitbranch': 'fugitive#head'
       \ },
       \ }

" Minimal configuration for jedi-vim
let g:jedi#show_call_signatures = "2"
"autocmd FileType python setlocal completeopt-=preview

" Allow tab-completion for directories
"let g:SuperTabDefaultCompletionType = "context"
"
" Expand trigger
"let g:UltiSnipsExpandTrigger="<c-j>"
" let g:ycm_key_list_previous_completion=['<Up>']
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsSnippetsDir="~/.vim/plugged/vim-snippets/UltiSnips"
let g:UltiSnipsEditSplit="tabdo"

" Take out function preview from YCM
set completeopt-=preview

" YCM/Jedi-vim variables to work together
" https://github.com/Valloric/YouCompleteMe/issues/234
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1

let g:jedi#auto_initialization = 1
"let g:jedi#completions_enabled = 0
" this enables auto-complete from imports with ctrl-o
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#smart_auto_mappings = 1
let g:jedi#popup_on_dot = 1
let g:jedi#completions_command = "<C-N>"
let g:jedi#show_call_signatures = "2"
let g:jedi#show_call_signatures_delay = 1


" Syntastic configuration
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']


" Window
nmap <leader>s<left>  :topleft  vnew<CR>
nmap <leader>s<right> :botright vnew<CR>
nmap <leader>s<up>    :topleft  new<CR>
nmap <leader>s<down>  :botright new<CR>

" Move between spltis
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>



" needed so that the snippets recognize .tex files
let g:tex_flavor='latex'

" opens pdf file using zathura
let g:vimtex_view_method = 'zathura'

" netrw file browsing
let g:netrw_banner=0 " hide banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1          "open splits to the right
let g:netrw_liststyle=3     "tree view

" set color column
hi ColorColumn ctermbg=darkgrey guibg=lightgrey
set colorcolumn=100

