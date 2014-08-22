" .vimrc



" No compatibility
set nocompatible
set encoding=utf-8



" Syntax highlighting

" Detect filetype
filetype plugin on
" Enable syntax highighting
syntax enable
" 256 colours, please
set t_Co=256
" Use the Solarized Dark theme
set background=dark
colorscheme solarized



" Set relevant filetypes
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.json set filetype=json syntax=javascript



" Tabs, indentation and lines

filetype plugin indent on
" 4 spaces please
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Round indent to nearest multiple of 4
set shiftround
" No line-wrapping
set nowrap



" Interactions

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5
" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]
" Underscores denote words
set iskeyword-=_



" Visual decorations

" Show status line
set laststatus=2
" Show what mode you’re currently in
set showmode
" Show what commands you’re typing
set showcmd
" Allow modelines
set modeline
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
	set number
endif
" Limit line-length to 80 columns by highlighting col 81 onward
if exists("+colorcolumn")
    set colorcolumn=81
endif
" Highlight current line
set cursorline
" Don’t keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase



" Make Vim more useful

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the (partial) command as it’s being typed
set showcmd
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
