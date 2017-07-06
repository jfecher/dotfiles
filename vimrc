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
"set complete-=i
"set showmatch
"set showmode

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

"folding
set fdm=manual
nnoremap F zfa}

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

inoremap { {}<left>
inoremap [ []<left>

inoremap <expr> <return> <SID>newline()

vnoremap <leader>[ "zdi[<c-r>z]
vnoremap <leader>{ "zdi{<c-r>z}

inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')

function! s:newline()
    let l:col = col('.')
    let l:chr = getline('.')[l:col-1]
    if l:chr == '}' || l:chr == ']' || l:chr == ')'
        return "\<return>\<return>\<up>\<tab>"
    else
        return "\<return>"
endf

function! s:escapepair(right)
	let l:col = col('.')
	let l:chr = getline('.')[l:col-1]
	if a:right == l:chr
		return "\<right>"
	else
		return a:right
endf

" ================== end of ClosePairs =======================

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*


"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" completely rebind movement keys
nnoremap <space> i
nnoremap i k
nnoremap k j
nnoremap j h

vnoremap <space> <Esc>
vnoremap i k
vnoremap k j
vnoremap j h

nnoremap ; :

nnoremap E $

" bind C-movement key to switch to a different split
map <silent><C-J> :wincmd h<CR>
map <silent><C-I> :wincmd k<CR>
map <silent><C-K> :wincmd j<CR>
map <silent><C-L> :wincmd l<CR>
map <silent><C-w>w :split<CR>
map <silent><C-w>j <C-w>J
map <silent><C-w>i <C-w>I 
map <silent><C-w>k <C-w>K
map <silent><C-w>l <C-w>L 
map <silent><C-;> :bdelete<CR>

map <silent><C-J> :hide bp<CR>
map <silent><C-L> :hide bn<CR>
map <silent><C-;> :bdelete<CR>

nmap <C-z> :undo<CR>
nmap <C-y> :redo<CR>
imap <C-z> <Esc>:undo<CR>
imap <C-y> <Esc>:redo<CR>

nmap <silent>t :terminal<CR>
tmap <silent><C-t> <C-c><space>exit<CR>

hi def link cCustomFunc Function
hi def link cCustomType Type

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

let mapleader = ','


"more plugins
"
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let b:syntastic_cpp_cflags = '--std=c++14'
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

"NERDTREE
map <silent> <F4> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/]\.[do]'

" vim-sneak, press s again to go to next match
let g:sneak#s_next = 1

" asyncrun
"set errorformat+=*
"
function! s:cErrCheck(check)
    call asyncrun#quickfix_toggle(10)
    if a:check
        AsyncRun! clang++ -std=c++14 -Iinclude -fsyntax-only %
    else
        AsyncRun make
    endif
endf

"
nmap <silent><F3> :call <SID>cErrCheck(0)<CR>
nmap ' :AsyncRun 
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

"YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"


"augroup vimrc
"    autocmd QuickFixCmdPost * call asyncrun#quickfix_toggle(10)
"augroup END

" C and C++ specifics
"au BufWritePost *.cpp,*.hpp,*.c,*.h call <SID>cErrCheck(1)
autocmd BufEnter *.cpp,*.hpp,*.c,*.h syn match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
autocmd BufEnter *.cpp,*.hpp,*.c,*.h syn match cCustomType /\<[A-Z]\w*\>/

"Apply hard text wrapping for .tex files
autocmd BufEnter *.tex nnoremap f :%s/\(.\{80\}\ \)/\1\r/g<Enter>

"open automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"javacomplete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
setlocal completefunc=javacomplete#CompleteParamsInfo
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space <C-X><C-U><C-P>

autocmd Filetype java nmap <silent><F3> :!clear && javac % && java $(echo % \| sed -e 's/\..*//')<CR>

autocmd! BufWritePost * Neomake

let g:neomake_open_list = 2

let g:neomake_warning_sign = { 'text': 'W', 'texthl': 'WarningMsg', }

let g:neomake_error_sign = { 'text': 'E', 'texthl': 'ErrorMsg', }

let g:neomake_c_enabled_makers = ['clang']
let g:neomake_c_clang_maker = {
    \ 'args': ['-Wall', '-Wextra', '-Weverything', -'pedantic', '-Iinclude'],
    \ }

let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
    \ 'args': ['-Wall', '-pedantic', '-Wsign-compare', '-Wno-sign-conversion', '-Iinclude', '-std=c++14'],
    \ 'exe': 'clang++',
    \ }

let g:neomake_ante_enabled_makers = ['ante']
let g:neomake_ante_ante_maker = {
    \ 'args': ['-check', '-no-color', '-lib'],
    \ 'errorformat': '%E%f: %l\,%c%.%#error:%m,'
    \              . '%W%f: %l\,%c%.%#warning:%m,'
    \              . '%C%.%#,' . "Compilation aborted."
    \ }
