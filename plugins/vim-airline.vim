" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme='atomic'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunk#enables = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
