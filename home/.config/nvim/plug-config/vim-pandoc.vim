"----------------------------------------------------------------------
" Vim-Pandoc
"----------------------------------------------------------------------
"{{{
let g:pandoc#modules#disabled = ["command"]
let g:pandoc#syntax#conceal#use = 0

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
"

let g:pandoc#command#custom_open = "MyPandocOpen"

function! MyPandocOpen(file)
    let file = shellescape(fnamemodify(a:file, ':p'))
    let file_extension = fnamemodify(a:file, ':e')
    if file_extension is? 'pdf'
        if !empty($PDFVIEWER)
            return expand('$PDFVIEWER') . ' ' . file
        elseif executable('zathura')
            return 'zathura ' . file
        elseif executable('mupdf')
            return 'mupdf ' . file
        endif
    elseif file_extension is? 'html'
        if !empty($BROWSER)
            return expand('$BROWSER') . ' ' . file
        elseif executable('firefox')
            return 'firefox ' . file
        elseif executable('chromium')
            return 'chromium ' . file
        endif
    elseif file_extension is? 'odt' && executable('okular')
        return 'okular ' . file
    elseif file_extension is? 'epub' && executable('okular')
        return 'okular ' . file
    else
        return 'xdg-open ' . file
    endif
endfunction

"}}}
