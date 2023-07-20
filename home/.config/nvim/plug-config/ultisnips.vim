"----------------------------------------------------------------------
" Snippets configuration
"----------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<c-.>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"set runtimepath+=~/.config/nvim/autoload/plugged/vim-snippets/snippets
let g:UltiSnipsSnippetDirectories=[
            \$HOME.'/.config/nvim/autoload/plugged/vim-snippets/UltiSnips',
            \$HOME.'/.config/nvim/autoload/plugged/vim-snippets/my_snippets']
            "\'UltiSnips']
            "\$HOME.'.vim/UltiSnips',
" Set the smart function definition to use numpy style for docstrings
let g:ultisnips_python_style="numpy"
let g:UltisnipsUsePythonVersion = 3
set cmdheight=2
let g:echodoc_enable_at_startup = 1
