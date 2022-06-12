call plug#begin('~/.config/nvim/plugged')
    
    Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes' 
    Plug 'challenger-deep-theme/vim', {'as': 'challenger-deep'}
    Plug 'Rigellute/shades-of-purple.vim'
	Plug 'preservim/nerdtree'	
	" Solidity
	Plug 'tomlion/vim-solidity'
    " Python
    Plug 'vim-python/python-syntax'
    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " HTML
    Plug 'mattn/emmet-vim'
	" NerdTree plugins
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Misc
    Plug 'tpope/vim-surround'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" transparent bg
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
"autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
"colorscheme challenger_deep
"colorscheme shades_of_purple

"Airline theme
let g:airline_theme='challenger_deep'

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  "let g:neosolarized_termtrans=1
  "runtime ./colors/NeoSolarized.vim
  "colorscheme NeoSolarized
  colorscheme challenger_deep
endif
"}}}

" NERDTree Settings
nnoremap <C-f> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" open NERDTree automatically
" autocmd VimEnter * NERDTree
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Common Go Commands
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
" Variable definition navigation
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
" Go syntax highlight
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" Emmet shorcuts
let g:user_emmet_mod='n' "only enable normal mode functions.
let g:user_emmet_leader_key=','

"Python syntax
let g:python_highlight_all = 1

" JavaScript syntax
let g:javascript_plugin_jsdoc = 1

"Mkdp
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" Mkdp keyMap
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

syntax on
set autoindent
set clipboard=unnamedplus
set hidden
set number relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set incsearch
set nohlsearch
set nowrap
set noswapfile
set noshowmode
set signcolumn=yes
set encoding=utf-8


" Use ; to auto pair (),{} and []
inoremap (; (<CR>)<C-c>O
inoremap {; {<CR>}<C-c>O
inoremap [; [<CR>]<C-c>O
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

