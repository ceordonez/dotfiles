"----------------------------------------------------------------------
" Julia
autocmd FileType julia nnoremap <S-F5> :call <SID>compile_and_run()<CR>
autocmd FileType,BufEnter,BufNewFile,BufNew julia set foldmethod=syntax
