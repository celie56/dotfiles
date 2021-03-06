" -----------------------------------------------------------------------------
" 	SETTINGS
" -----------------------------------------------------------------------------
" None of that compatibility here
set nocompatible

syntax on
colorscheme desert
let g:cpp_class_scope_highlight = 1

source $HOME/dotfiles/molokai.vim

set tabstop=4
set autoindent
set cindent
set shiftwidth=4
set number
set cursorline
set backspace=indent,eol,start
set nowrap

" -----------------------------------------------------------------------------
" 	REMAPS
" -----------------------------------------------------------------------------
" follow the leader to space :)
let mapleader = "\<Space>"
" new escape
inoremap kj <Esc>
" just in case I fall back to control backspace 
inoremap <C-BS> <C-W>
" quick tabnext -- I don't really use this too often...
nnoremap ]] :tabn<CR>
" quick visual search
vnoremap // y/<C-R>"<CR>

"save
nnoremap <Leader>w :w<CR>
nnoremap <Leader><Leader>w :wa<CR>
"save and quit
nnoremap <Leader>x :x<CR>
nnoremap <Leader><Leader>x :xa<CR>
"quit
nnoremap <Leader><Leader>q :q<CR>
"open
nnoremap <Leader>e :e 
"open folder view
nnoremap <Leader><Leader>e :e .<CR>
nnoremap <Leader><Leader><Leader>e :e $HOME<CR>
"window stuff
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>k <C-w>k
nnoremap <Leader>j <C-w>j

" -----------------------------------------------------------------------------
" 	MOUSE UTILITIES
" -----------------------------------------------------------------------------
" handle gnu screen
set ttymouse=xterm2
" handle mouse click
set mouse=a

" -----------------------------------------------------------------------------
" 	STATUS LINE
" -----------------------------------------------------------------------------
set laststatus=2 		"always show statusbar

set statusline=%t\       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

hi StatusLine ctermfg=magenta ctermbg=black
if version >= 700
	au InsertEnter * hi StatusLine ctermfg=yellow ctermbg=blue
	" gui=undercurl guisp=Magenta
	au InsertLeave * hi StatusLine ctermfg=magenta ctermbg=black
	"gui=bold,reverse
endif


