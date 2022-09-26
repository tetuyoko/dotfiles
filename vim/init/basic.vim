scriptencoding utf-8
" Zenkaku.
set ambiwidth=double
" Stop ring the bell.
set t_vb=
set visualbell
set noerrorbells
set modeline
set clipboard+=unnamed
set nocompatible
set number
set ruler
set cmdheight=2
set title
set linespace=0
set wildmenu
set showcmd
set textwidth=120
set swapfile
set directory=~/.vim/swp

" Edit
set autoindent
set cindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed
set pastetoggle=<F12>
set guioptions+=a

" Tab
au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4

set tabstop=2
set expandtab
set smarttab
set shiftwidth=2
set shiftround
set nowrap

" Keymap
set bioskey
set timeout
set timeoutlen=500
