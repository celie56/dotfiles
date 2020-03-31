" None of that compatibility here
set nocompatible
set noswapfile
syntax enable
set termguicolors

set expandtab
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set number
set backspace=indent,eol,start
set nowrap

set clipboard=unnamed
set hlsearch
set mouse=a

" do not resize on window close
set noequalalways


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

" copy filepath
nnoremap cp :let @+ = expand("%")<cr>

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
" open folder of current file
nnoremap <Leader><Leader>e :e <C-R>=expand('%:p:h') . '/'<CR><CR>
nnoremap <Leader><Leader><Leader>e :e $HOME<CR>
"window stuff
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>k <C-w>k
nnoremap <Leader>j <C-w>j
"buffer
nnoremap <Leader>b :b

" http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory
" set %% to current dir
cabbr <expr> %% expand('%:p:h')

" toggle paste mode
set pastetoggle=<Leader><Leader>p

" Buffers
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bl :e#<CR>

" Tabs
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>


command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

" Don't indent on : in Python
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:

" -----------------------------------------------------------------------------
" 	Terminal Stuff
" -----------------------------------------------------------------------------

if has('nvim')
    tnoremap <Esc><Esc> <C-\><C-n>
endif

" -----------------------------------------------------------------------------
" 	Cursor Line
" -----------------------------------------------------------------------------

hi CursorLine   cterm=NONE ctermbg=lightred ctermfg=NONE guibg=darkred guifg=NONE
" set cursorline
nnoremap <Leader>c :set cursorline!<CR>
set cursorline



" -----------------------------------------------------------------------------
" 	Vundle       
" -----------------------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ---- Vim-GO
Plugin 'fatih/vim-go'

" --- Python docstring
Plugin 'heavenshell/vim-pydocstring'
let g:pydocstring_doq_path = '/Users/chriselie/.pyenv/shims/doq'

" --- Ctr-P fuzzy find
" Plugin 'ctrlpvim/ctrlp.vim'

" --- fuzzy find round 2
Plugin 'junegunn/fzf'
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "*.pyc" --glob "!venv/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Search files
nmap <Leader>f :Files<CR> 
" Search buffers
nmap <Leader>B :Buffers<CR>

" --- Rippin' grep
Plugin 'jremmen/vim-ripgrep'
nmap <Leader>/ :Rg<Space>

" --- I can see clearly now, the code is gone
Plugin 'junegunn/limelight.vim'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" --- Center view
Plugin 'junegunn/goyo.vim'
let g:goyo_linenr = 1 " Show line numbers

" --- Colorss
Plugin 'morhetz/gruvbox'
Plugin 'arcticicestudio/nord'

" --- Bookmarks
Plugin 'MattesGroeger/vim-bookmarks'

" --- Google plugin requirement
Plugin 'google/vim-maktaba'

" --- Coverage
Plugin 'google/vim-coverage'

" --- Org Mode
Plugin 'jceb/vim-orgmode'

" --- Fugitive
Plugin 'tpope/vim-fugitive'

" --- tag outline
Plugin 'majutsushi/tagbar'

" Airline --------------------------------------------------------------------
Plugin 'vim-airline/vim-airline'
"set encoding=utf-8
" let g:airline_powerline_fonts = 1
set laststatus=2
"set guifont=Source\ Code\ Pro\ Semibold:h10
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_inactive_collapse=1
let g:airline#extensions#tabline#fnamecollapse = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

colorscheme gruvbox
set background=light

let g:python3_host_prog='/Users/chriselie/.virtualenvs/envs-5OV5slmi/python'
let g:python_host_prog='/Users/chriselie/.virtualenvs/envs-5OV5slmi/python'
