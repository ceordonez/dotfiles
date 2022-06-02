
let g:tex_flavor='pdflatex'
" let g:tex_flavor='latexmk'
" let g:vimtex_compiler_engine = 'lualatex'
" let g:tex_flavor='lualatex'
" let g:tex_fast='bcpmrsSvV'

" let g:vimtex_compiler_progname=$HOME.'/.virtualenvs/neovim3/bin/nvr'
" Never Forget, To set the default viewer:: Very Important
" let g:Tex_ViewRule_pdf = 'zathura'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_manual=1
let latex_to_unicode_tab = 0
 " Deactivate conceal in latex (e.g transform latex functions to unicode)
let g:vimtex_syntax_conceal_disable = 1
"let g:vimtex_syntax_conceal = {'math_bounds': 0}
let g:vimtex_toc_config={'layer_status': {'content': 1, 'label': 0, 'todo': 1, 'include': 0}}
