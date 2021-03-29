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
        \     'hook/sweep/files' : [
        \                           '%S:p:r.aux',
        \                           '%S:p:r.dvi',
        \                           '%S:p:r.fdb_latexmk',
        \                           '%S:p:r.fls',
        \                           '%S:p:r.log',
        \                           '%S:p:r.toc',
        \                           '%S:p:r.lot',
        \                           '%S:p:r.lof',
        \                           '%S:p:r.out'
        \                           ],
        \     'exec': ['%c -cd %o %s'],
        \   },
        \ }
"set splitright
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>

autocmd BufWritePost,FileWritePost *.tex QuickRun tex
