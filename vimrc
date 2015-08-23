" vim-sublime - A minimal Sublime Text -like vim experience bundle
"               http://github.com/grigio/vim-sublime
" Best view with a 256 color terminal and Powerline fonts

set nocompatible
filetype off
execute pathogen#infect()

colorscheme monokai

""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
set backspace=indent,eol,start
set complete-=i
"set showmatch
set showmode

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set laststatus=2
set ruler
set showcmd
set wildmenu
set nowrap
set autoread
set ttyfast
set undolevels=1000
set autoindent
set smartindent


set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set history=1000
set lazyredraw
set nohidden

set noerrorbells visualbell t_vb= " Disable ALL bells

set scrolloff=10
set sidescroll=1
set sidescrolloff=10
set splitright

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" do not history when leavy buffer
set hidden

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

set completeopt=menuone,longest,preview

"
" Plugins config
"


"==============================================================================
" closepairs.vim - Auto closes pairs of characters
"==============================================================================
"
" Author:   NoWhereMan (Edoardo Vacchi) <uncommonnonsense at gmail dot com>
" Version:  0.1
" URL: 	    http://www.flatpress.org/
" License:  Public Domain
"==============================================================================

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

vnoremap <leader>" "zdi"<c-r>z"
vnoremap <leader>' "zdi'<c-r>z'
vnoremap <leader>( "zdi(<c-r>z)
vnoremap <leader>[ "zdi[<c-r>z]
vnoremap <leader>{ "zdi{<c-r>z}

inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')

inoremap <expr> " <SID>pairquotes('"')
inoremap <expr> ' <SID>pairquotes("'")


function! s:escapepair(right)
	let l:col = col('.')
	let l:chr = getline('.')[l:col-1]
	if a:right == l:chr
		return "\<right>"
	else
		return a:right
endf

function! s:pairquotes(pair)
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-1]
	if a:pair == l:chr
		return "\<right>"
	else
		return a:pair.a:pair."\<left>"
endf
" ================== end of ClosePairs =======================

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*


"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> P
vmap <C-c> y

nnoremap <space> i
nnoremap i k
nnoremap k j
nnoremap j h

nnoremap ; :

nmap <silent><C-j> :wincmd h<CR>
nmap <silent><C-i> :wincmd k<CR>
nmap <silent><C-k> :wincmd j<CR>
nmap <silent><C-l> :wincmd l<CR>

nmap <silent><F3> :w<CR>:!clear<CR>:make<CR>:!uxterm<CR><F11>
hi def link cCustomFunc Function
hi def link cCustomType Type

" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

let mapleader = ','


"more plugins
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"NERDTREE
map <silent> <F4> :NERDTreeToggle<CR>

autocmd BufEnter *.cpp,*.c,*.h syn match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
autocmd BufEnter *.cpp,*.c,*.h syn match cCustomType /\<[A-Z]\w*\>/

"open automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
