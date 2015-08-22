
" To install plugins use the command:
" :PluginInstall
"
"
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/dotfiles/Vundle
call vundle#begin()

	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'

	" Examples -------------------------------------------------------------------

	" plugin on GitHub repo
	" Plugin 'tpope/vim-fugitive'

	" plugin from http://vim-scripts.org/vim/scripts.html
	" Plugin 'L9'

	" Git plugin not hosted on GitHub
	" Plugin 'git://git.wincent.com/command-t.git'

	" git repos on your local machine (i.e. when working on your own plugin)
	" Plugin 'file:///home/gmarik/path/to/plugin'

	" ----------------------------------------------------------------------------

	" My plugins go here :)

	" Airline --------------------------------------------------------------------
	" https://www.alexwhittemore.com/gvim-with-powerline-on-windows-8-64bit/Airline
	Plugin 'bling/vim-airline'
	set encoding=utf-8
	let g:airline_powerline_fonts = 1
	set guifont=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 10

	" Colors ---------------------------------------------------------------------
	Plugin 'flazz/vim-colorschemes'

	" Display Marks --------------------------------------------------------------
	Plugin 'kshenoy/vim-signature'



	" ----------------------------------------------------------------------------

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
