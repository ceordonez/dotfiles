
" Neovim configuration file
" Autor: Cesar Ordonez
"
" set runtimepath^=~/.vim,~/.vim/after
" set packpath+=~/.vim

" Although anything in ~/.config/nvim/plugin will automatically be sourced, I find it convenient to individually source config files so as to be able to easily comment out config files that are not needed while leaving them intact.

" GENERAL
source $HOME/.config/nvim/vim-plugin/plugin.vim
source $HOME/.config/nvim/general/settings.vim
"
"" TEXT SUPPORT
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/ale.vim
source $HOME/.config/nvim/plug-config/vim-grammarous.vim
source $HOME/.config/nvim/plug-config/vim-easy-align.vim
source $HOME/.config/nvim/plug-config/markdown-preview.vim
source $HOME/.config/nvim/plug-config/vim-markdown.vim
source $HOME/.config/nvim/plug-config/indentLine.vim
source $HOME/.config/nvim/plug-config/lists.vim
""source $HOME/.config/nvim/plug-config/vim-pandoc.vim
""source $HOME/.config/nvim/plug-config/languagetool.vim


" FILE MANAGEMENT
source $HOME/.config/nvim/plug-config/nerdtree.vim

" AUTOCOMPLETE
"source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim

" MAPPINGS
source $HOME/.config/nvim/keys/mappings.vim
"
" APPEARANCE
source $HOME/.config/nvim/themes/airline.vim
"source $HOME/.config/nvim/plug-config/goyo.vim

" ADDITIONAL FUNCTIONS
source $HOME/.config/nvim/plug-config/vim-tmux-navigator.vim
"source $HOME/.config/nvim/plug-config/vimwiki.vim
source $HOME/.config/nvim/plug-config/wiki.vim

" PROGRAMMING
source $HOME/.config/nvim/general/quickrun.vim
"source $HOME/.config/nvim/plug-config/julia-vim
source $HOME/.config/nvim/plug-config/ncm2.vim

source $HOME/.config/nvim/plug-config/zotcite.vim

filetype plugin on
syntax on

"source $HOME/.vimrc

" Escape terminal mode with <Esc>
tnoremap <Esc> <C-\><C-n>

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

let $PATH = $HOME.'/bin:' . $PATH

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
