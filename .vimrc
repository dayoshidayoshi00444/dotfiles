syntax on

set background=dark

" 文字コードをUTF-8に設定
set encoding=utf-8

" ファイルの文字コードの設定（左から優先的に読み込まれる）
set fileencodings=utf-8,shift-jis

" 改行コードの自動判別
set fileformats=unix,dos,mac

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

" バックスペースの設定
set backspace=indent,eol,start

" viとの互換性を無効に
set nocompatible

" 括弧入力時に対応する括弧を表示
set showmatch

" コマンドラインモードでtabキーによるファイル名補完
set wildmenu

" 検索をハイライト
set hlsearch
set incsearch

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" フォントの設定
set guifont=Cica-Regular:h16
set printfont=CicaRegular:h12

" 全角文字の幅を2に固定
set ambiwidth=double

" マウスを有効
" set mouse=a

" jjでinsertからnormal
inoremap jj <ESC>

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/')
  let s:toml      = g:rc_dir . '.dein.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

colorscheme lucid

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
 autocmd VimEnter * NERDTree ./
endif

autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python3 %

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
nnoremap <silent> <C-p> :PrevimOpen<CR>

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Macdownで現在のバッファのファイルを開く
command Macdown :!open -a macdown %

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 50

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_bin_path = $GOPATH.'/bin'
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
filetype plugin indent on

"vimtex
let g:vimtex_latexmk_opetions = '-pdfdvi'
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
let g:vimtex_compiler_latexmk = {'callback' : 0}

"vim-quickrun
nmap <Leader>r <Plug>(quickrun)
 let g:quickrun_config = {
        \   "_": {
        \     "hook/close_quickfix/enable_success" : 1,
        \     "hook/close_buffer/enable_failure" : 1,
        \     "outputter" : 'error',
        \     "hook/echo/enable" : 1,
        \     "hook/echo/wait" : 20,
        \     "runner": "vimproc",
        \     'hook/time/enable' : 1
        \   },
        \   'tex':{
        \	'hook/back_tabpage/enable_exit' : 1,
        \	'hook/back_window/enable_exit': 1,
        \	'hook/back_tabpage/priority_exit': 1,
        \	'hook/back_window/priority_exit': 1,
        \   'outputter/buffer/close_on_empty' : 1,
        \     'outputter/buffer/split': ':60split',
        \     'command' : 'latexmk',
        \     'cmdopt': '-pv',
        \     'exec': ['%c -cd %o %s']
        \   },
        \ }
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>

autocmd BufWritePost,FileWritePost *.tex QuickRun tex
command! OpenBro execute "OpenBrowser" expand("%:p")

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.tex setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" winresizer
let g:winresizer_start_key = '<C-T>'
let g:winresizer_vert_resize = 2
let g:winresizer_horiz_resize = 2

if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

