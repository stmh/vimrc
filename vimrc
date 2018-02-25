set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle, required
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'rizzatti/dash.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Yggdroot/indentLine'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'szw/vim-tags'
Plug 'craigemery/vim-autotag'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'tacahiroy/ctrlp-funky'
Plug 'tpope/vim-sensible'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/Align'
Plug 'dietsche/vim-lastplace'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-dispatch'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'sheerun/vim-polyglot'
Plug 'josuegaleas/jay'
Plug 'arcticicestudio/nord-vim'
Plug 'w0rp/ale'
Plug 'wincent/terminus'

call plug#end()

" Other stuff
filetype plugin indent on
syntax on

set laststatus=2
set noshowmode

" UI
set background=dark
colorscheme nord
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20

set guifont=Suisse\ Int\'l\ Mono\ for\ Powerline:h14
set guifont=PragmataPro:h15
if has('gui_running')
  set macligatures
  set lines=35 columns=120
endif
set colorcolumn=90
set number
set formatoptions=qrn1
set colorcolumn=85
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:▼
set visualbell
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar="·"
set cursorline
set relativenumber

" Performance
set ttyfast
let g:matchparen_timeout = 10
let g:matchparen_insert_timeout = 10
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" set synmaxcol=128

" Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Multiple cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction


" Leader-key
let mapleader=","
set hidden
set history=2000

" tab-settings
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set smartcase
set ignorecase
set incsearch
set autowrite             " Save on buffer switch
set autoread              " Check when a file is edited by another program
set visualbell
set nowritebackup
set noswapfile
set nobackup

" Cleanup whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Search
set hlsearch
set showmatch

" Mappings
map <Leader>s :syntax sync fromstart<CR>
nnoremap <Leader>cs :%!phpcbf --standard=Drupal --extensions=php,module,inc,install,test,profile,theme<enter><enter>
nnoremap <leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>h :Dash<CR>
nnoremap <leader>a :Ag
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>e :VimFilerExplorer<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>T :CtrlPTag<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>
" Disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader><space> :noh<cr>
nmap ü <C-]>
nmap Ü <C-O>
nmap Ö {
nmap Ä }
nnoremap öö [[
nnoremap ää ]]
nnoremap äö ][
nnoremap öä []
nnoremap <Leader># :SemanticHighlightToggle<cr>
nmap <Leader>tc :tabclose<CR>
nmap <tab> :tabNext<CR>


" ale settings
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'php': ['phpcs'],
      \}
let g:ale_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
let g:ale_php_phpcs_standard="Drupal"
let g:ale_php_phpcs_exec="/usr/local/bin/phpcs"
let g:ale_javascript_jshint_exec="/usr/local/bin/jshint"
let g:ale_javascript_eslint_exec="/usr/local/bin/eslint"
let g:ale_vue_checkers = ['eslint']
let g:ale_lint_delay=1000
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" PHP
let php_folding = 0
let php_html_in_strings = 0
let php_html_in_heredoc = 0
let php_sql_query = 1
let php_noShortTags = 1
:autocmd FileType php set foldmethod=indent

" Tags
set tags+=tags;$HOME

" CtrlpFunky
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_user_command = 'ag %s -l --ignore-dir .git --ignore-dir node_modules --ignore .DS_Store --nocolor --hidden -U -g ""'


" cd to current file-dir on BufEnter
autocmd BufEnter * silent! lcd %:p:h

" Better yanking: http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap <expr>y "my\"" . v:register . "y`y"

" python
au FileType python setl sw=2 sts=2 et


" Better search and replace
" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

let g:vim_json_syntax_conceal = 0

" gui colors if running iTerm
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif


" map // to search for selected text
vnoremap // y/<C-R>"<CR>

vnoremap . :norm.<CR>

" Toggle background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Move lines with Ctrl-j / Ctrl-k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" set shell explicetely
set shell=/bin/bash

" sneak
let g:sneak#label = 1

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" Lightline statusbar
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Drupal specifics
au BufRead,BufNewFile *.theme set filetype=php
au BufRead,BufNewFile *.install set filetype=php


" Dash

nmap <silent> K <Plug>DashSearch
