" vim-sublime - A minimal Sublime Text -like vim experience bundle
"               http://github.com/grigio/vim-sublime
" Best view with a 256 color terminal and Powerline fonts

set nocompatible
execute pathogen#infect('/home/rndmprsn/.config/nvim/bundle/{}')
syntax on
filetype plugin indent on


" gruvbox config
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_invert_selection = 0
let g:gruvbox_invert_signs = 0

set background=dark
colorscheme gruvbox
" colorscheme ante
" colorscheme monokai

""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set clipboard+=unnamedplus

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

set completeopt=menuone,longest

"folding
" set fdm=manual
" nnoremap F zfa}


set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.o,*.ao,*.d,*.gch,*.class


"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" completely rebind movement keys
" hjkl -> jkil
nnoremap <space> i
nnoremap i k
nnoremap k j
nnoremap j h

vnoremap <space> <Esc>
vnoremap i k
vnoremap k j
vnoremap j h

nmap <silent><C-w>j <C-w>h
nmap <silent><C-w>i <C-w>j
nmap <silent><C-w>J <C-w>H

nmap <silent><C-w>I <C-w>J
nmap <silent><C-w>j <C-w>h
nmap <silent><C-w>i <C-w>j

" Pressing esc is too much of a stretch, this isn't emacs
inoremap jj <Esc>

tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" This should be a default really
nnoremap ; :

" bind C-movement key to switch to a different split
nnoremap <silent><C-j> <C-w>h
nnoremap <silent><C-i> <C-w>k
nnoremap <silent><C-k> <C-w>j
nnoremap <silent><C-l> <C-w>l

inoremap <silent><C-j> <Esc><C-w>h
inoremap <silent><C-i> <Esc><C-w>k
inoremap <silent><C-k> <Esc><C-w>j
inoremap <silent><C-l> <Esc><C-w>l

tnoremap <silent><C-j> <C-\><C-n><C-w>h
" tnoremap <silent><C-i> <C-\><C-n><C-w>k   this breaks tab completion
tnoremap <silent><C-k> <C-\><C-n><C-w>j
" tnoremap <silent><C-l> <C-\><C-n><C-w>l   this breaks clearing of terminal


nmap <silent>J :hide bp<CR>
nmap <silent>L :hide bn<CR>

nmap <silent>t :terminal<CR><space>

tnoremap <silent>J <C-\><C-n>:hide bp<CR>
tnoremap <silent>L <C-\><C-n>:hide bn<CR>

hi def link cCustomFunc Function
hi def link cCustomType Type

" vim-airline
let g:airline_powerline_fonts = 1
" let g:airline_theme='badwolf'
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

let mapleader = '\'
map <Leader> <Plug>(easymotion-prefix)


" Autopairs
" Disable jumping to matching } ] or ) across multiple lines when key is pressed
let g:AutoPairsMultilineClose = 0


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
let g:ctrlp_custom_ignore = '*.[do]'

let g:ctrlp_by_filename = 1
let g:ctrlp_by_regexp = 1

" vim-sneak, press s again to go to next match
let g:sneak#s_next = 1

let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

"YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/bundle/YouCompleteMe/.ycm_extra_conf.py"


"fugitive cfg
autocmd BufReadPost fugitive://* set bufhidden=delete

"clang complete cfg
let g:clang_library_path = '/usr/lib/libclang.so.6.0'
"let g:clang_snippets = 1
let g:clang_auto_select = 1
let g:clang_close_preview = 1
let g:clang_user_options = '-std=c++17 -Iinclude'
let g:clang_complete_patterns = 1

let g:python_host_skip_check = 1
let g:python_host_prog = '/usr/bin/python2'

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

"autocmd! BufWritePost * Neomake

let g:neomake_open_list = 2

let g:neomake_warning_sign = { 'text': 'W', 'texthl': 'WarningMsg', }

let g:neomake_error_sign = { 'text': 'E', 'texthl': 'ErrorMsg', }

let g:neomake_c_enabled_makers = ['clang']
let g:neomake_c_clang_maker = {
    \ 'args': ['-Wall', '-Wextra', '-Weverything', -'pedantic', '-Iinclude'],
    \ }

let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
    \ 'args': ['-Wall', '-pedantic', '-Wsign-compare', '-Wno-sign-conversion', '-Iinclude', '-std=c++17'],
    \ 'exe': 'clang++',
    \ }

let g:neomake_ante_enabled_makers = ['ante']
let g:neomake_ante_ante_maker = {
    \ 'args': ['-check', '-no-color', '-lib'],
    \ 'errorformat': '%E%f: %l\,%c%.%#error:%m,'
    \              . '%W%f: %l\,%c%.%#warning:%m,'
    \              . '%C%.%#,' . "Compilation aborted."
    \ }


" nvim-gdb bindings
nnoremap <leader>dd :GdbStart gdb -q -f ./a.out
nnoremap <leader>dl :GdbStart lldb ./ante<CR>
nnoremap <leader>db :GdbBreakpointToggle<CR>
nnoremap <leader>dn :GdbNext<CR>
nnoremap <leader>dc :GdbContinue<CR>
