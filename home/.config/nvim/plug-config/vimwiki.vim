"----------------------------------------------------------------------
" Notes with vimwiki
"----------------------------------------------------------------------
set nocompatible
let g:vimwiki_list = [{ 'path': '~/Dropbox/Cesar/Notes/',
                    \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" makes vimwiki markdown list as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1
let g:markdown_folding = 0
