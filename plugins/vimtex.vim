"vimtex
let g:vimtex_latexmk_options = '-pdfdvi'
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
let g:vimtex_compiler_latexmk = {
        \ 'background': 1,
        \ 'build_dir': '',
        \ 'continuous': 1,
        \ 'callback' : 0,
        \ 'options': [
        \   '-pdfdvi',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \],
        \}
