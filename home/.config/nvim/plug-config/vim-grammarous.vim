"----------------------------------------------------------------------
" Grammarous configuration
"----------------------------------------------------------------------
"{{{
" Setting for grammar check (Grammarous)
let g:grammarous#disabled_rules = {
            \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'COMMA_PARENTHESIS_WHITESPACE'],
            \ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
            \ }
" Use vim spellang
let g:grammarous#use_vim_spelllang = 1
"}}}
