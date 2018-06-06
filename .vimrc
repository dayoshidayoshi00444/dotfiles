syntax on

set t_Co=256
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

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" フォントの設定
set guifont=Cica-Regular:h16
set printfont=CicaRegular:h12

" 全角文字の幅を2に固定
set ambiwidth=double

" jjでinsertからnormal
inoremap jj <ESC>

" esc2回でハイライトを消す
nnoremap <ESC><ESC> :nohl<CR>

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
  let s:toml      = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

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

" ファイルタイプごとにインデントの設定
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType go setl tabstop=4 noexpandtab shiftwidth=4 
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.tex setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='atomic'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['go', 'nerdtree']

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
nnoremap <silent> <C-p> :PrevimOpen<CR>

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Macdownで現在のバッファのファイルを開く
command Macdown :!open -a macdown %

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_bin_path = $GOPATH.'/bin'
let g:go_gocode_unimported_packages = 0
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
autocmd FileType go :highlight goErr cterm=bold ctermfg=244
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
        \    "_": {
        \     "hook/close_quickfix/enable_success" : 1,
        \     "hook/close_buffer/enable_failure" : 1,
        \     "outputter" : 'error',
        \     "hook/echo/enable" : 1,
        \     "hook/echo/wait" : 20,
        \     'outputter/error/error': 'quickfix',
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
"set splitright
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>

autocmd BufWritePost,FileWritePost *.tex QuickRun tex

" winresizer
let g:winresizer_start_key = '<C-T>'
let g:winresizer_vert_resize = 2
let g:winresizer_horiz_resize = 2

" neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" neoterm
let g:neoterm_fixedsize = 1
let g:neoterm_size = 12
let g:neoterm_default_mod = "botright"
xmap gx <Plug>(neoterm-repl-send)

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" deopleteのpreviewをインサートモードから抜けた時に閉じる
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete-clang
let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/6.0.0/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/usr/local/Cellar/llvm/6.0.0/lib/clang"

" ale
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
