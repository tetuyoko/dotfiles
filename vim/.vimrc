scriptencoding utf-8
" ミュートにする
set t_vb=
set visualbell
set noerrorbells
set modeline

" JavaScript Lint
" if !exists('b:current_compiler')
"   compiler jsl
" endif
" autocmd QuickFixCmdPost make copen

filetype off                   " required!

inoremap jk <ESC>
" let mapleader = ","
noremap \ ,

" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

" Neobundle set up
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'szw/vim-tags'
NeoBundle 'vimproc'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'shime/vim-livedown'

let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
 "let g:vimrubocop_config = '.rubocop.yml'
 
"let g:livedown_autorun = 0
"let g:livedown_open = 1
"let g:livedown_port = 1337
noremap gm :call LivedownPreview()<CR>

call neobundle#end()

filetype plugin indent on
" NeoBundleCheck

" let Vundle manage Vundle
" required!
" Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'pangloss/vim-javascript'

" vim-quickrun
" bufferを下部に表示
let g:quickrun_config={'*': {'split': ''}}
set splitbelow
" 実行時間を常に表示
let g:quickrun_config = {'*': {'hook/time/enable': '1'}}
" buffer出したらカーソルは下部に移動
let g:quickrun_config = {"_" : { "outputter/buffer/into" : 1,}}

"This is To Use vim-pathogen
"call pathogen#infect()

runtime macros/editexisting.vim

set nocompatible
set number
set ruler
set cmdheight=2
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set title
set linespace=0
set wildmenu
set showcmd
set textwidth=72
"set textwidth=78
"set columns=100
"set lines=150

" for US keybord
noremap ; :
noremap : ; 

" syntax color
" --------------------
syntax on
"colorscheme ron
"colorscheme Tomorrow-Night-Blue
highlight LineNr ctermfg=darkgrey

" search
" --------------------
set ignorecase
set smartcase
set wrapscan
set hlsearch
:nnoremap <ESC><ESC> :nohlsearch<CR>
:nnoremap <F9> :NERDTreeToggle<CR>
:nnoremap <silent><C-n> :NERDTreeToggle<CR>
" :nnoremap <F9> :NERDTreeToggle<CR>

" edit
" --------------------
set autoindent
set cindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed
set pastetoggle=<F12>
set guioptions+=a

" tab
" --------------------
set tabstop=2
set expandtab
set smarttab
set shiftwidth=2
set shiftround
set nowrap

" keymap
" --------------------
set bioskey
set timeout
set timeoutlen=500

" brackets
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap <> <><LEFT>

"backup 
"set backup
""set bakupdir=~/vim_backup
set swapfile
set directory=~/.vim/swp

