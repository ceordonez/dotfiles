" Change direcotry to folder of opened file
cd %:p:h
set title           " Toggle title on
set titlestring=%t%(\ %M%)%(\ %y%)  " Set the title string
set scrolloff=3     " When scrolling, keep cursor 3 lines away from screen border
set autoread        " Files are read as soon as they are changed
set noswapfile      " Don't use swapfile for the buffers
set noerrorbells    " Don't show error messages
set visualbell      " Set visual bell instead of beeping
set nobackup        " Don't use backup files
set nowritebackup
set encoding=utf-8  " Set the character encoding to utf-8
set foldmethod=marker   " Set the default folding method
set cursorline      " Highlight the current line
set breakindent showbreak=..    " Linebreaks with indentation
set linebreak
set hidden          " Change buffer without saving
set expandtab       " Use spaces to replace tabs
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set softtabstop=4   " Number of spaces that a <Tab> counts for on editing operations
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set virtualedit=block   " Allow virtual editing in Visual block mode
set wildignore=*.swp,*.bak,*.pyc,*.class,*.aux,*.toc    " Ignore some file extensions
set laststatus=2    " Always show status bar
set incsearch       " Incremental search
set hlsearch        " Highlighted search results
set nu              " Line numbers
set diffopt+=vertical " Set vertical split as default for diff
let $PYTHONUNBUFFERED=1 " See python real-time output
set list
set listchars=tab:>-

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=niv
endif

"----------------------------------------------------------------------
" Colors for GVim
"----------------------------------------------------------------------
if (has("termguicolors"))
    set termguicolors
endif
if has('gui_running')
    let g:seoul256_background=234
    colorscheme seoul256
elseif has('nvim')
    colorscheme nord
endif
"----------------------------------------------------------------------
" Automatically close autocompletion window
"----------------------------------------------------------------------
augroup autocompl_window
    autocmd!
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END
"----------------------------------------------------------------------
" Tablength exceptions
"----------------------------------------------------------------------
"{{{
augroup spell_group
    autocmd!
    autocmd BufEnter,BufNewFile,BufNew *.tex syntax spell toplevel
    autocmd BufEnter,BufNewFile,BufNew *.tex setlocal spell
    autocmd BufEnter,BufNewFile,BufNew markdown setlocal spell
    autocmd BufEnter,BufNewFile,BufNew pandoc-markdown setlocal spell
    autocmd BufEnter,BufNewFile,BufNew *.py setlocal nospell
    autocmd BufRead,BufEnter,BufNewFile */Notes/* setlocal nospell
augroup END

augroup file_type
    autocmd!
    autocmd FileType python AirlineRefresh
    autocmd FileType python setlocal
                \ shiftwidth=4
                \ tabstop=4
                \ softtabstop=4
                \ expandtab
    autocmd FileType html setlocal
                \ shiftwidth=2
                \ tabstop=2
    autocmd FileType htmldjango setlocal
                \ shiftwidth=2
                \ tabstop=2
    autocmd FileType javascript setlocal
                \ shiftwidth=2
                \ tabstop=2
    autocmd FileType tex AirlineRefresh
    autocmd FileType tex setlocal
                \ shiftwidth=2
                \ tabstop=2
                \ softtabstop=2
                \ expandtab
    autocmd FileType markdown setlocal
                \ shiftwidth=2
                \ tabstop=2
                \ softtabstop=2
                \ expandtab
    autocmd FileType fortran setlocal
                \ shiftwidth=3
                \ tabstop=3
                \ softtabstop=3
                \ expandtab
    autocmd FileType yaml setlocal
                \ ts=2
                \ sts=2
                \ sw=2
                \ expandtab
augroup END
"}}}

"----------------------------------------------------------------------
" Python configuration
"----------------------------------------------------------------------
filetype on
let python_highlight_all=1
let g:loaded_python_provider=0
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0
"let g:python_host_prog  = $HOME.'/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.virtualenvs/neovim3/bin/python'
