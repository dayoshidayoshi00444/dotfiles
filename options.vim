syntax on

" Leaderキーをスペースに設定
let g:mapleader = "\<Space>"

set t_Co=256
set background=dark

" 文字コードをUTF-8に設定
set encoding=utf-8

" ファイルの文字コードの設定（左から優先的に読み込まれる）
set fileencodings=utf-8,shift-jis

" 改行コードの自動判別
set fileformats=unix,dos,mac

" ミュート
set belloff=all

" 検索時大文字小文字を区別しない
set ignorecase

" タイトルの表示
set title

" 現在行のハイライト
set cursorline

" 行番号の表示
set number

" オートインデント 
set autoindent

" tabを半角スペースで入力
set expandtab

" tab幅をスペース4つに
set tabstop=4
set shiftwidth=4

" キーボードでtabを入力した時スペース4つに 
set softtabstop=4
set smarttab

" 改行時に自動でインデント
set smartindent

" 不可視文字を表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" バックスペースの設定
set backspace=indent,eol,start

" viとの互換性を無効に
set nocompatible

" 括弧入力時に対応する括弧を表示
set showmatch

" コマンドラインモードでtabキーによるファイル名補完
set wildmenu

" スワップファイルを作成しない
set noswapfile

" バックアップを取らない
set nobackup
set nowritebackup

" 検索をハイライト
set hlsearch
set incsearch

" 全角文字の幅を2に固定
"set ambiwidth=double

set termguicolors

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" ファイルタイプごとにインデントの設定
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType go setl tabstop=4 noexpandtab shiftwidth=4 
autocmd FileType tex setl tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType markdown setl tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType vim setl tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html setl tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType typescript setl tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript setl tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType json setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType rust setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" htmlの閉じタグを自動補完
autocmd FileType html inoremap <buffer> </ </<C-x><C-o>

" python3
let g:python3_host_prog = '/usr/bin/python3'

" grepした結果をquickfixに表示する {{{
augroup grepwindow
  au!
  au QuickFixCmdPost *grep* cwindow
augroup END
" }}}
