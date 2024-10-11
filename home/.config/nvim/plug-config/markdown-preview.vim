let g:mkdp_auto_close=0
let g:mkdp_combine_preview = 1
let g:mkdp_combine_preview_auto_refresh = 1
nnoremap <M-m> :MarkdownPreview<CR>

function OpenMarkdownPreview (url)
  execute "silent ! firefox --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
