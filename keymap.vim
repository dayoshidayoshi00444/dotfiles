" jj でinsertからnormal
inoremap jj <ESC>

" esc2回でハイライトを消す
nnoremap <ESC><ESC> :nohl<CR>

" 折り返し時に表示行単位での移動をできるようにする
nnoremap j gj
nnoremap k gk

" ターミナルモードでEscキーもしくはjjでnormalモードに移動
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> jj <C-\><C-n>

" Leader+nでvimrcを開く
nnoremap <Leader>n :e ~/.vimrc<CR>
nnoremap <Leader>s :exe "source" expand("%")<CR>

" タブ切り替え
nnoremap <C-l> gt
nnoremap <C-h> gT

" Leader+p Leader+y でシステムのクリップボードにコピー&ペーストする
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" 閉じ括弧補完
inoremap { {}<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>
