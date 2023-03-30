"----------------------------------------------------------------------
" Powerline configurations
"----------------------------------------------------------------------
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
if has('win32')
    set guifont=Source\ Code\ Pro\ for\ Powerline:h10
elseif has('vim')
    set guifont=Noto\ Mono\ for\ Powerline
elseif has('nvim')
    " set guifont=Fira\ Code:h11
    set guifont=FuraCode\ Nerd\ Font\ Medium:h11
endif

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Cooperation with Asyncrun
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
