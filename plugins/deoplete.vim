" deoplete
let g:deoplete#enable_at_startup = 1

" deopleteのpreviewをインサートモードから抜けた時に閉じる
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
