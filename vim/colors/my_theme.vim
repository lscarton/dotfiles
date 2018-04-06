" Vim color file
" Maintainer: Dharmin B.
" Last Change:	24 March 2018
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "my_theme"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
" highlight Normal     guifg=Grey80	guibg=Black
" highlight Search     guifg=Black	guibg=Red	gui=bold
" highlight Visual     guifg=#404040			gui=bold
" highlight Cursor     guifg=Black	guibg=Green	gui=bold
" highlight Special    guifg=Orange
" highlight Comment    guifg=#80a0ff
" highlight StatusLine guifg=blue		guibg=white
" highlight Statement  guifg=Yellow			gui=NONE
" highlight Type						gui=NONE

" Console
highlight Normal     ctermfg=White	ctermbg=Black
highlight Search     ctermfg=Red	ctermbg=NONE cterm=bold
highlight Visual					cterm=reverse
highlight Cursor     ctermfg=Black	ctermbg=Green	cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=DarkGrey
highlight StatusLine ctermfg=blue	ctermbg=white
highlight Statement  ctermfg=Yellow			cterm=NONE
highlight Type		ctermfg=LightGreen		cterm=NONE
highlight Cursorline ctermbg=NONE term=bold cterm=bold 
highlight CursorLineNR ctermbg=NONE term=bold cterm=bold
highlight String ctermfg=LightBlue 
highlight Number ctermfg=DarkMagenta
highlight Float ctermfg=DarkMagenta
highlight Boolean ctermfg=DarkMagenta
highlight Operator ctermfg=Yellow
highlight Identifier ctermfg=Green cterm=NONE
highlight Function ctermfg=Blue cterm=bold
highlight Include ctermfg=Yellow cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    highlight Search  ctermfg=Black	ctermbg=Red	cterm=bold	guifg=Black       guibg=Red	gui=bold
    highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040			gui=bold
    highlight Special ctermfg=LightBlue			cterm=NONE	guifg=LightBlue			gui=NONE
    highlight Comment ctermfg=Cyan			cterm=NONE	guifg=LightBlue			gui=NONE
  endif
endif

