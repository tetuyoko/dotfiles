scriptencoding utf-8
" ミュートにする
set t_vb=
set visualbell
set noerrorbells
set modeline

" クリップボード設定
set clipboard+=unnamed

" TagBar
nnoremap <silent> ,t :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_updateonsave_maxlines = 10000
let g:tagbar_sort = 0

" ステータスライン表示
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%{tagbar#currenttag('[%s]','')}%{fugitive#statusline()}%{SyntasticStatuslineFlag()}%{exists('*SkkGetModeStr')?SkkGetModeStr():''}%=%l/%L,%c%V%8P\ 
set noshowmode
set wildmenu
set cmdheight=2
set wildmode=list:full
set showcmd

" JavaScript Lint
if !exists('b:current_compiler')
  compiler jsl
endif
autocmd QuickFixCmdPost make copen

filetype off                   " required!

inoremap jk <ESC>
" let mapleader = ","
noremap \ ,

" Ctrpで0番レジスタを呼ぶ
vnoremap <silent> <C-p> "0p<CR>

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
" NeoBundle 'vimproc'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'shime/vim-livedown'
NeoBundle 'majutsushi/tagbar'
" 自動で閉じる
NeoBundle 'tpope/vim-endwise'
" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
" NeoBundle 'fatih/vim-go'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'kchmck/vim-coffee-script'

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/Cellar/rsense/0.3/libexec'
let g:rsenseUseOmniFunc = 1
setlocal completefunc=RSenseCompleteFunction

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
":nnoremap <silent><C-n> :NERDTreeToggle<CR>
:nnoremap <silent><C-n> :NERDTreeCWD<CR>
:nnoremap <silent><C-a> :NERDTreeClose<CR>

" :nnoremap <F9> :NERDTreeToggle<CR>

let g:NERDTreeIgnore=['\.sass-cache', '\.DS_Store','\.bundle$',  '\.git$',  '\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=2

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


" coffee
" --------------------
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデント設定
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
" オートコンパイル
"保存と同時にコンパイルする
autocmd BufWritePost *.coffee silent make! 
"エラーがあったら別ウィンドウで表示
autocmd QuickFixCmdPost * nested cwindow | redraw! 
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

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

execute pathogen#infect()
syntax on
filetype plugin indent on
