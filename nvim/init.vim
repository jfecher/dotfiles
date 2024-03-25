" vim-sublime - A minimal Sublime Text -like vim experience bundle
"               http://github.com/grigio/vim-sublime
" Best view with a 256 color terminal and Powerline fonts

set nocompatible
execute pathogen#infect('/home/rndmprsn/.config/nvim/bundle/{}')
syntax on
filetype plugin indent on

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" gruvbox config
let g:gruvbox_option = "light"

" possible = {soft, medium, hard}
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "medium"
let g:gruvbox_invert_selection = 0
let g:gruvbox_invert_signs = 0

set background=dark
set termguicolors
colorscheme gruvbox

" Always set background to black to get transparency in the terminal
hi Normal guibg=#000
hi SignColumn guibg=#000

""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set clipboard=unnamed

let g:clipboard = {
    \   'copy': {
    \       '+': ['wl-copy'],
    \       '*': ['wl-copy'],
    \   },
    \   'paste': {
    \       '+': ['wl-paste', '--trim-newline'],
    \       '*': ['wl-paste', '--trim-newline'],
    \   },
    \ }

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

set hidden

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

set completeopt=menuone,noinsert,noselect

"folding
" set foldmethod=indent
" nnoremap F zfa}

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.cbp,*/target/*
set wildignore+=*.o,*.ao,*.d,*.gch,*.class,*.obj,*/build/*,*/llvm_build/*

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

nnoremap , ;

nmap <silent><C-w>j <C-w>h
nmap <silent><C-w>i <C-w>j
nmap <silent><C-w>J <C-w>H

nmap <silent><C-w>I <C-w>J
nmap <silent><C-w>j <C-w>h
nmap <silent><C-w>i <C-w>j

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Pressing esc is too much of a stretch, this isn't emacs
inoremap jj <Esc>

tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" This should be a default really
nnoremap ; :

nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

" Remap bd so it doesn't close the current pane when the window is split
nnoremap <silent>z :bn\|bd#<CR>

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

" tnoremap <silent>J <C-\><C-n>:hide bp<CR>
" tnoremap <silent>L <C-\><C-n>:hide bn<CR>

" vim-airline
let g:airline_powerline_fonts = 1
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
set statusline+=%*

"NERDTREE
map <silent> <F4> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_custom_ignore = '((*.[do]))|(((build)|(target))/.*)'

" let g:ctrlp_by_filename = 1
" let g:ctrlp_by_regexp = 1

" vim-sneak, press s again to go to next match
let g:sneak#s_next = 1

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

" C and C++ specifics
"au BufWritePost *.cpp,*.hpp,*.c,*.h call <SID>cErrCheck(1)
autocmd BufEnter *.cpp,*.hpp,*.c,*.h syn match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
autocmd BufEnter *.cpp,*.hpp,*.c,*.h syn match cCustomType /\<[A-Z]\w*\>/

hi def link cCustomFunc Function
hi def link cCustomType Type

"Apply hard text wrapping for .tex files
autocmd BufEnter *.tex nnoremap f :%s/\(.\{80\}\ \)/\1\r/g<Enter>

" nvim-gdb bindings
nnoremap <leader>dd :GdbStart gdb -q -f ./a.out
" nnoremap <leader>dl :GdbStartLLDB ante<space>
nnoremap <leader>db :GdbBreakpointToggle<CR>
nnoremap <leader>dn :GdbNext<CR>
nnoremap <leader>dc :GdbContinue<CR>


nnoremap <leader>d :VBGstartGDB ./ante
nnoremap <leader>b :VBGtoggleBreakpointThisLine<CR>
nnoremap <leader>n :VBGstepOver<CR>
nnoremap <leader>s :VBGstepIn<CR>
nnoremap <leader>c :VBGcontinue<CR>
nnoremap <leader>e :VBGeval<space>
nnoremap <leader>k :VBGkill<CR>

autocmd Filetype coq nnoremap ,, :CoqRunToCursol<CR>C-wJ

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require 'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp', priority = 8 },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip', priority = 6 }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer', priority = 7 },
    }),
    sorting = {
      priority_weight = 1.0,
      comparators = {
        -- cmp.config.compare.score_offset, -- not good at all
        cmp.config.compare.locality,
        cmp.config.compare.recently_used,
        cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
        cmp.config.compare.offset,
        cmp.config.compare.order,
        -- cmp.config.compare.scopes, -- what?
        -- cmp.config.compare.sort_text,
        -- cmp.config.compare.exact,
        -- cmp.config.compare.kind,
        -- cmp.config.compare.length, -- useless 
      },
    }
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
  }


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', 'ge', vim.diagnostic.open_float)
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next)
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gq', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gwa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', 'gwr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', 'gwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

EOF

let g:termdebug_wide = 1
set laststatus=1

" haskell config
let g:haskell_indent_if = 0
let g:haskell_indent_let = 0


hi def link anOp GruvboxRed
hi def link anType GruvboxBlueBold
hi def link anModule GruvboxAqua
