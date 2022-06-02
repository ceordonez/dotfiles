
" Visual selection automatically copies to the clipboard
set clipboard+=unnamedplus
nnoremap y "+y
vnoremap y "+y
snoremap y "+y
nnoremap <S-Insert> "+p
"
" More space to write! :)
set guioptions-=m  " Remove menu bar
set guioptions-=T  " Remove toolbar

" Edit commands for the navifation in help documents
nnoremap <C-9> <C-]>

" For the matchup plugin
let g:matchup_surround_enabled = 1

inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

" Mapping to Open Vimrc
" Map to stop highlighting of last search
nnoremap <leader>pp :nohlsearch<cr>

" Folding remaping
nnoremap <space> za
vnoremap <space> zf

" Map <Esc> to Shift-Space. Its more confortable
inoremap <S-Space> <Esc>
vnoremap <S-Space> <Esc>
snoremap <S-Space> <Esc>

inoremap <M-Space> <Esc>
vnoremap <M-Space> <Esc>
snoremap <M-Space> <Esc>

" Mapping to Open Vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" ...and to Source Vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Movements
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Move to the next buffer
nmap tn :bnext<CR>
" Move to the previous buffer
nmap tp :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" Show pending tasks list
noremap <F2> :TaskList<CR>
"}}}
