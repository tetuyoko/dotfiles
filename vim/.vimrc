" ALE
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
"let b:ale_fixers = {'vue': ['prettier', 'eslint']}
let g:ale_fixers = {'ruby': ['rubocop']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

" use ctrlp
"let g:ctrlp_user_command = 'ag %s -l'

let g:jsx_ext_required = 1 " Allow JSX in normal JS files

" ステータスライン表示
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%{tagbar#currenttag('[%s]','')}%{fugitive#statusline()}%{SyntasticStatuslineFlag()}%{exists('*SkkGetModeStr')?SkkGetModeStr():''}%=%l/%L,%c%V%8P\
set noshowmode
set wildmenu
set cmdheight=2
set wildmode=list:full
set showcmd

filetype off                   " required!

inoremap jk <ESC>
" let mapleader = ","
noremap \ ,

" Ctrpで0番レジスタを呼ぶ
vnoremap <silent> <C-p> "0p<CR>

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/Cellar/rsense/0.3/libexec'
let g:rsenseUseOmniFunc = 1
setlocal completefunc=RSenseCompleteFunction

"let g:livedown_autorun = 0
"let g:livedown_open = 1
"let g:livedown_port = 1337
noremap gm :call LivedownPreview()<CR>

filetype plugin indent on

" vim-quickrun
" bufferを下部に表示
let g:quickrun_config={'*': {'split': ''}}
set splitbelow
" 実行時間を常に表示
let g:quickrun_config = {'*': {'hook/time/enable': '1'}}
" buffer出したらカーソルは下部に移動
let g:quickrun_config = {"_" : { "outputter/buffer/into" : 1,}}

set nocompatible
set number
set ruler
set cmdheight=2
set title
set linespace=0
set wildmenu
set showcmd
set textwidth=120
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
" :nnoremap <silent><C-n> :NERDTreeCWD<CR>
" :nnoremap <silent><C-a> :NERDTreeClose<CR>

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:.  -buffer-name=search-buffer<CR>

" unite grepにpt(plutinum searcher)を使う
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

:nnoremap <F9> :NERDTreeToggle<CR>

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

au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4

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

"dein Scripts
"-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" dein.vim install
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " load TOML and cache
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" brackets
inoremap { {}<LEFT>
inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
inoremap <> <><LEFT>

"backup 
"set backup
""set bakupdir=~/vim_backup
set swapfile
set directory=~/.vim/swp

execute pathogen#infect()

syntax on
filetype plugin indent on
