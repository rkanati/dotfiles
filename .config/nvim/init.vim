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
" set shell=fish

" use ESC to get out of terminal windows
tnoremap <C-q> <C-\><C-n>

" digraph ++ → ⧺
dig ++ 10746

" highlight spilling lines
set colorcolumn=+1
hi ColorColumn cterm=bold ctermfg=Red ctermbg=233

" convenient save-all-quit
nnoremap ZX :xa<cr>

" ZQ is possibly hazardous
nnoremap ZQ <nop>

" use CTRL-hjkl for window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q
nnoremap <C-s> <nop>

" clipboard
set clipboard=unnamedplus

" custom commands
let mapleader="\\"

" nohlsearch shortcut
nnoremap <leader>n :noh<cr>

" easy buffer switching
nnoremap <leader>j :bp<cr>
nnoremap <leader>k :bn<cr>

" fuzzy-find
" XXX absolute fucking disaster - /dev/tty is a no-no in neovim, and termopen et al. is utter
" garbage
"
" autocmd TermOpen * startinsert
"
" function! HSCommand(src_command, hs_args, first_command, rest_command)
"   let output = []
"   function! OnStdout(job, data, stream) closure
"     let output += a:data
"   endfunction
"
"   function! OnDone(job, code, event) closure
"     let l:first = 1
"     for l:item in output
"       if first
"         exec a:first_command . " " . l:item
"         let l:first = 0
"       else
"         exec a:rest_command . " " . l:item
"       endif
"     endfor
"   endfunction
"
"   let l:opts = {
" \   'on_stdout': function('OnStdout'),
" \   'stdout_buffered': 1,
" \   'on_exit': function('OnDone')
" \ }
"   enew
"   let l:job = termopen(a:src_command . ' | hs ' . a:hs_args, l:opts)
"   if l:job <= 0
"     echo 'Error running heatseeker:'
"     return
"   end
" endfunction
"
" function! HSOpen()
"   call HSCommand("find * -type f", "", "e", "badd")
" endfunction
"
" nnoremap <leader>o :call HSOpen()<cr>

nnoremap <leader>o :FZF<cr>

