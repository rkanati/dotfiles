" kill netrw
let loaded_netrwPlugin = 1

" plugins etc
execute pathogen#infect ()
Helptags

" appearance
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme = "term"

colorscheme arktu

" enable airline selectively
let g:airline_extensions =
\ [ 'tabline'
\ , 'branch'
\ , 'quickfix'
\ , 'wordcount'
\ , 'whitespace'
\ ]

" tabline configuration
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnamemod = ":gs#\\.\\./#‥#:."
let g:airline#extensions#tabline#fnamecollapse = 1

" syntax stuff
filetype plugin indent on
syntax on

let g:rust_recommended_style = 0
autocmd FileType rust setlocal tabstop=4

let g:haskell_indent_disable          = 1
let g:haskell_classic_highlighting    = 0
let g:haskell_enable_quantification   = 1
let g:haskell_enable_arrowsyntax      = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles        = 1
let g:haskell_enable_static_pointers  = 1
let g:haskell_backpack                = 1

" ui config
set laststatus=2
set showcmd
set modelines=3
set nonumber numberwidth=5
set scrolloff=12
set cursorline
set switchbuf=usetab
set shortmess+=aAIs
set splitright

" no folding, please
set foldmethod=manual nofoldenable

" indentation and edit correction
set expandtab tabstop=2
set shiftwidth=0 shiftround
set cinoptions=l1
set textwidth=100
set formatoptions-=t
set virtualedit=block

" match case-insensitive when lowercase
set ignorecase smartcase

" wrangle files sensibly
set hidden
set backupdir=~/.local/share/nvim/backup
set directory=~/.cache/nvim/swap//
set autoread autowrite

" my shell
set shell=fish

" use ESC to get out of terminal windows
tnoremap <Esc> <C-\><C-n>

" digraph ++ → ⧺
dig ++ 10746

" highlight spilling lines
set colorcolumn=+1
hi ColorColumn cterm=bold ctermfg=Red ctermbg=233

" convenient save-all-quit
nnoremap ZX :xa<CR>

" ZQ is possibly hazardous
nnoremap ZQ <nop>

" use CTRL-hjkl for window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q
nnoremap <C-s> <nop>

" custom commands
let mapleader="\\"

" nohlsearch shortcut
nnoremap <Leader>n :noh<CR>

" easy buffer switching
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>

" clipboard
set clipboard=unnamedplus

