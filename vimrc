" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation fetches from;
" https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

colorscheme nord

" map spacebar as leader key
nnoremap <space> <nop>
let mapleader=" "

" my mappings
:command! W w
:command! Q q
:command! WQ wq
:command! Wq wq
:command! YCMoff let g:ycm_auto_trigger=0
:command! YCMon let g:ycm_auto_trigger=1
:command! Label VimtexLabelsOpen

" change cursor in different modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" mapping Tab and Shift+Tab to move among tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT

" disable scroll using mouse
" set mouse=a
nmap <ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
imap <ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
vmap <ScrollWheelUp> <nop>
vmap <ScrollWheelDown> <nop>

" setting to keep cursor line in middle
set scrolloff=5

" Vim loads indentation and plugins acc. to detected filetype
"filetype plugin indent on
filetype plugin on

" Vim jumps to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Run current script in python with F5
" nnoremap <F5> :! python %<cr>
nnoremap <F5> :! python3 %<cr>

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

" Comment lines or blocks
noremap <silent> <C-_> :Commentary<cr>
" use // for c, cpp type files
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
" use # for cmake, Cmakelists.txt type files
autocmd FileType cmake setlocal commentstring=#\ %s


" Enable syntax highlighting
syntax enable

" make hidden characters like tabs or EOL visible
set listchars=nbsp:_,trail:.,tab:▸\ ,eol:¬
" set list

" disable auto-commenting when entering new line
autocmd FileType * setlocal formatoptions+=c formatoptions+=r formatoptions-=o

" enter the current millenium
set nocompatible

" hide buffers instead of closing when switching to another buffer
set hidden

" use every file in current dir and child dir while "find" ind
set path=**

" wildmenu for fuzzy file finding
set wildmenu

set foldmethod=indent  " Default fold method
" set the method for folding depending on language
autocmd FileType c,cpp,java,scala set foldmethod=syntax
autocmd FileType sh,ruby,python   set foldmethod=indent
set foldmethod=indent   
" level of nesting to fold
set foldnestmax=4
"set nofoldenable
set foldlevel=1

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
set expandtab|retab

" Indent when moving to the next line while writing code
set autoindent

" Show the matching part of the pair for [] {} and ()
set showmatch

" setting smart indentation
set smartindent

" set color column
hi ColorColumn ctermbg=darkgrey guibg=lightgrey
set colorcolumn=80
" set textwidth
set textwidth=80
" disable autowrap text when writing in insert mode
set formatoptions-=t
" disable wrapping the lines
set nowrap


" Enable all Python syntax highlighting features
let python_highlight_all = 1

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
" let g:UltiSnipsSnippetsDir="~/.vim/snippets"
let g:UltiSnipsSnippetsDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit="tabdo"
let g:ultisnips_python_style="sphinx"

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

" fuzzy file finder (fzf) bindings
nnoremap <leader>og :GFiles<CR>
nnoremap <leader>of :Files<CR>
nnoremap <leader>ob :Buffers<CR>
nnoremap <leader><space> :b#<CR>

" Move between spltis
nmap <leader>k :wincmd k<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>h :wincmd h<CR>
nmap <leader>l :wincmd l<CR>

" open directory tree on left side
nnoremap <leader>t :30Lexplore<CR>

" needed so that the snippets recognize .tex files
let g:tex_flavor='latex'

" opens pdf file using zathura
let g:vimtex_view_method = 'zathura'

" netrw file browsing
let g:netrw_banner=0 " hide banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1          "open splits to the right
let g:netrw_liststyle=3     "tree view

" markdown preview config
nnoremap <leader>p :MarkdownPreview<CR>
nnoremap <leader>ps :MarkdownPreviewStop<CR>
let g:mkdp_refresh_slow=1
let g:mkdp_auto_close=0
