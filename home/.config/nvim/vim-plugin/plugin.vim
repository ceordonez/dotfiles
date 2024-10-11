"----------------------------------------------------------------------
" Pluggins
"----------------------------------------------------------------------
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute "!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

call plug#begin('~/.config/nvim/autoload/plugged')
" Vim-wiki"
"Plug 'vimwiki/vimwiki'
Plug 'lervag/wiki.vim'
" Convert latex expressions into unicode equivalents
Plug 'lervag/lists.vim'
Plug 'joom/latex-unicoder.vim'
" Ultisnips
Plug 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Rainbow parentheses
Plug 'luochen1990/rainbow', { 'for': 'python' }
" vim-Grammarous
Plug 'rhysd/vim-grammarous'
" Autoclose (autocloses parenthesis)
Plug 'Townk/vim-autoclose'
" Nord colorscheme
Plug 'arcticicestudio/nord-vim'
"Plug 'shaunsingh/nord.nvim'
" Seoul256 color theme
Plug 'junegunn/seoul256.vim'
" Indent text object
Plug 'michaeljsmith/vim-indent-object', { 'for': 'python' }
" Fix white spaces at end of lines
Plug 'bronson/vim-trailing-whitespace'
" Vim indent guides (colors!)
Plug 'nathanaelkane/vim-indent-guides'
" ALE
Plug 'dense-analysis/ale'
" COC
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Better file browser
Plug 'preservim/nerdtree'
" Asyncrun
Plug 'skywind3000/asyncrun.vim'
" Julia support
Plug 'JuliaEditorSupport/julia-vim' " Vim-Airline
Plug 'bling/vim-airline'
" vim-pandoc: Pandoc support
" Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown' }
" Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
" Latex
Plug 'lervag/vimtex', {'for': 'tex'}
", 'commit': 'a69b58b3d29f90d8ffce777bc18d6599e51c4f49'}
" Latex Ultisnips
Plug 'gillescastel/latex-snippets'
" Easy Aling
Plug 'junegunn/vim-easy-align'
" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
" Indentations
Plug 'Yggdroot/indentLine'
" Writing checker
" Plug 'preservim/vim-wordy'
" Plug 'dpelle/vim-LanguageTool'
Plug 'junegunn/goyo.vim'
Plug 'puremourning/vimspector'
" vim diff char"
Plug 'rickhowe/diffchar.vim'
" nvim-r"
Plug 'jalvesaq/Nvim-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
"Plug 'itchyny/lightline.npm


" Markdown Preview"
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes npm install' }

" Vim Markdown"
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'rev': '0.1.8'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jalvesaq/zotcite', {'branch': 'vim'}
call plug#end()
""
