set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle, required
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'rizzatti/dash.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'Yggdroot/indentLine'
Plug 'rking/ag.vim'
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'Konfekt/FastFold'
Plug 'nelsyeung/twig.vim', { 'for': 'twig' }
Plug 'isRuslan/vim-es6'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-haml'
Plug 'plasticboy/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'Shougo/neocomplete.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'swekaj/php-foldexpr.vim'
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
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'easymotion/vim-easymotion'
Plug 'jremmen/vim-ripgrep'
call plug#end()

" Other stuff
filetype plugin indent on
syntax on

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tabs = 0

let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

set noshowmode

" UI
colorscheme iceberg
let g:airline_theme='lucius'
set guifont=Suisse\ Int\'l\ Mono\ for\ Powerline:h14
set guifont=Fira\ Code:h14
if has('gui_running')
  set macligatures
endif
set lines=35 columns=120
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
set ttyscroll=3
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
nmap <tab> :tabNext<CR>
nmap <Leader>tc :tabclose<CR>
imap jj <ESC>

" Syntastic settings
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
let g:syntastic_javascript_jshint_exec="/usr/local/bin/jshint"
let g:syntastic_javascript_eslint_exec="/usr/local/bin/eslint"
let g:syntastic_vue_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" PHP
let php_folding = 0
let php_html_in_strings = 0
let php_html_in_heredoc = 0
let php_sql_query = 1
let php_noShortTags = 1
let b:phpfold_use = 1
let b:phpfold_doc_with_funcs = 1
let b:phpfold_group_args=0
:autocmd FileType php set foldmethod=expr

" Tags
set tags+=tags;$HOME

" CtrlpFunky
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_user_command = 'ag %s -l --ignore-dir .git --ignore-dir node_modules --ignore .DS_Store --nocolor --hidden -U -g ""'


" Markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


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

"  move text and rehighlight -- vim tip_id=224
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" gui colors if running iTerm
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" map // to search for selected text
vnoremap // y/<C-R>"<CR>

vnoremap . :norm.<CR>
