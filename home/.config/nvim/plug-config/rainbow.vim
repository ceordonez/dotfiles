"----------------------------------------------------------------------
" Rainbow parentheses
"----------------------------------------------------------------------
"{{{
let g:rainbow_active = 1
let g:rainbow_conf = {
            \'guifgs': ['darkorange', 'seagreen', 'royalblue', 'firebrick'],
            \'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \'operators': '_,_',
            \'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \'separately': {
            \    '*': {},
            \    'tex': {
            \        'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \    },
            \    'lisp': {
            \        'guifgs': ['royalblue', 'darkorange', 'seagreen', 'firebrick', 'darkorchid'],
            \    },
            \    'vim': {
            \        'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \    'html': {
            \        'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \    'css': 0,
            \   }
            \}
"}}}
