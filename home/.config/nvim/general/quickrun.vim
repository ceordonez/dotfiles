"----------------------------------------------------------------------
" Quick run
"----------------------------------------------------------------------

nnoremap <F5> :call <SID>compile_and_run()<CR>

augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(10, 1)
augroup END

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
        exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
        exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
        exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
        exec "AsyncRun -cwd=$(VIM_FILEDIR) -save=1 -pos=bottom -rows=15 -focus=0 python3 '$(VIM_FILEPATH)'"
    elseif &filetype == 'julia'
        exec "AsyncRun julia %:p"
    endif
endfunction
