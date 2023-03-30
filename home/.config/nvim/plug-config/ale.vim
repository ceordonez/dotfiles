"----------------------------------------------------------------------
" Ale configurations
"----------------------------------------------------------------------
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_linters = {
            \   'python': ['pylint'],
            \   'tex': ['chktex', 'proselint', 'lacheck', 'write-good'],
            \   'fortran': ['gcc'],
            \   'markdown': ['alex', 'proselint'],
            \   'javascript': ['javac'],
            \   'dockerfile': ['hadolint'],
            \}

let g:ale_fixers = {
            \   'python': ['black', 'isort'],
            \   'tex': ['remove_trailing_lines', 'latexindent'],
            \   'markdown': ['prettier'],
            \   'javascript': ['prettier'],
            \   'bib': ['bibclean'],
            \   'json': ['prettier'],
            \   'vim': ['trim_whitespace'],
            \}

" call deoplete#custom#source('ale', 'rank', 999)

" Define map for the Fix function
noremap <LocalLeader>= :ALEFix<cr>

" Change default symbols for ALE
let g:ale_sign_error = ">>"
let g:ale_sign_warning = ">"
" let g:ale_python_auto_pipenv = 1
" let g:ale_python_pylint_change_directory=0
" let g:ale_python_flake8_change_directory=0
