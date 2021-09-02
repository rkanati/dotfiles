" kill netrw
let loaded_netrwPlugin = 1

" plugins etc
" packloadall
helptags ALL

" custom commands
let mapleader = "\\"
map , <leader>
map <space> <leader>

" APPEARANCE =======================================================================================
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" ayu-vim -------------------
set termguicolors
let ayucolor = "dark"
colorscheme ayu-rk
let g:airline_theme = "ayu"

" oceanic-next --------------
" set termguicolors
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
" let g:airline_theme = "oceanicnext"

" vim-one -------------------
" set termguicolors
" let g:one_allow_italics = 1
" colorscheme one
" set background=dark
" let g:airline_theme = "one"

" onedark -------------------
" let g:airline_theme = "term"
" let g:onedark_terminal_italics = 1
" let g:onedark_terminal_bold = 1
" set termguicolors
" augroup colorextend
"     autocmd!
"     autocmd ColorScheme * call onedark#extend_highlight("Normal", {"bg": {"gui": "NONE"}})
" augroup END
" colorscheme onedark

" arktu (mine) --------------
" colorscheme arktu
" let g:airline_theme = "term"


" enable airline selectively
let g:airline_extensions =
\ [ 'tabline'
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

" let g:rust_recommended_style = 0
autocmd FileType rust setlocal tabstop=4

" set up LSP
lua <<EOF
    local lspconfig = require'lspconfig'

    local on_attach = function(client)
    --  require'completion'.on_attach(client)
    end

    lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        cmd = { "rustup", "run", "nightly", "rust-analyzer" },
        settings = {
            ["rust-analyzer"] = {
                procMacro = {
                    enable = true
                },
                cargo = {
                    loadOutDirsFromCheck = true,
                    runBuildScripts = true
                }
            }
        }
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                spacing = 4,
                prefix = "⊢"
            },
            update_in_insert = true,
        }
    )
EOF

" menuone: show menu even for one match
" noinsert: don't insert until selection confirmed
" noselect: don't select anything automatically
set completeopt=menuone,noinsert,noselect

lua <<EOF
require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'disable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        nvim_lsp = { priority = 2; };
        buffer = { priority = 1; };
        path = false; -- FIXME fucks up LSP completion after "/ ", like a divide
        nvim_lua = false;
        vsnip = false;
        calc = false; -- kinda shitty tbh; thinks `1_000` is just zero...
    };
}
EOF

nnoremap <silent> <C-i> <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> <leader>i <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> <leader>s <cmd>lua vim.lsp.buf.signature_help()<cr>

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

nnoremap <silent> <leader>R <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent> <leader>A <cmd>lua vim.lsp.buf.code_action()<cr>
xnoremap <silent> <leader>A <cmd>lua vim.lsp.buf.range_code_action()<cr>
" xnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.range_formatting()<cr>

" TODO

sign define LspDiagnosticsSignError       text=✘
sign define LspDiagnosticsSignWarning     text=▲
sign define LspDiagnosticsSignInformation text=ℹ
sign define LspDiagnosticsSignHint        text=★

autocmd CursorMoved,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua
\   require'lsp_extensions'.inlay_hints {
\       prefix = '',
\       highlight = "LspDiagnosticsVirtualTextHint",
\       enabled = {"ChainingHint", "TypeHint"}
\   }

" ui config
set laststatus=2
set showcmd
set noshowmode
set modelines=3
set nonumber numberwidth=5
set scrolloff=8
set cursorline
set switchbuf=usetab
set shortmess+=aAIsc
set splitright
set signcolumn=yes:1
set showbreak=+
set wildmenu wildmode=list:longest,full

" no folding, please
set foldmethod=manual nofoldenable

" indentation and edit correction
set expandtab tabstop=4
set shiftwidth=0 shiftround
set cinoptions=l1
set textwidth=100
set formatoptions=cqj
set virtualedit=block
" set formatoptions+=a

" match case-insensitive when lowercase
set ignorecase smartcase

" wrangle files sensibly
set hidden
set backupdir=~/.local/share/nvim/backup
set directory=~/.cache/nvim/swap//
set autoread autowrite
set updatetime=500

" my shell
" set shell=fish

" use ESC to get out of terminal windows
tnoremap <C-q> <C-\><C-n>

" digraph ++ → ⧺
dig ++ 10746

" highlight spilling lines
set colorcolumn=+1,+2,+3
hi ColorColumn cterm=bold ctermfg=Red ctermbg=233

" convenient save-all-quit
nnoremap ZX :xa<cr>

" ZQ and ZZ are possibly hazardous
nnoremap ZQ <nop>
nnoremap ZZ <nop>

" ^Q for :ex is fucking annoying
nnoremap <C-q> <nop>

" use CTRL-hjkl for window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q
nnoremap <C-s> <nop>

" clipboard
set clipboard=unnamedplus
" inoremap <C-R> <C-r>'"'

" nohlsearch shortcut
nnoremap <silent> <leader>n :noh<cr>

" easy buffer switching
nnoremap <silent> <leader>j :bp<cr>
nnoremap <silent> <leader>k :bn<cr>

nnoremap <leader>O :Files<cr>
nnoremap <leader>o :GFiles -cmo --exclude-standard<cr>
nnoremap <leader>p :Buffers<cr>
nnoremap <leader>g :Rg<cr>

" save and save-all
nnoremap <leader>w :w<cr>
nnoremap <leader>W :wa<cr>

" rust
let g:cargo_shell_command_runner = '!'
nnoremap <leader>b :Cbuild<cr>

