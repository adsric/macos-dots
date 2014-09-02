" .vimrc



" !silent is used to suppress error messages if the config line
" references plugins/colorschemes that might be missing



" Point to location of pathogen submodule (since it's not in .vim/autoload)
silent! runtime bundle/vim-pathogen/autoload/pathogen.vim
" Call pathogen plugin management
silent! call pathogen#infect()



" Disable Vi compatibility
set nocompatible
" Use UTF-8 without BOM
set encoding=utf-8 nobomb



if has("autocmd")
    " Load files for specific filetypes
    filetype on
    filetype indent on
    filetype plugin on

    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif



" Syntax highlighting

" Enable syntax highlighting
syntax enable
" Set 256 color terminal support
set t_Co=256
" Set dark background
set background=dark
" Set colorscheme
colorscheme solarized



" Tabs, indentation and lines

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
" When making a change, don't redisplay the line, and instead, put a `$` sign
" at the end of the changed text
set cpoptions+=$



" Visual decorations

" Show status line
set laststatus=2
" Broken down into easily includeable segments
" Filename
set statusline=%<%f\
" Options
set statusline+=%w%h%m%r
" Current dir
set statusline+=\ [%{getcwd()}]
" Right aligned file nav info
set statusline+=%=%-14.(%l,%c%V%)\ %p%%
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
" Enable search highlighting
set hlsearch
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
" Tab autocomplete longest possible part of a string, then list
set wildmode=longest,list
if has ("wildignore")
    set wildignore+=*.a,*.pyc,*.o,*.orig
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.sw?,*.tmp
endif
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
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
" Hide mouse pointer while typing
set mousehide
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



" Key Mappings

" Change mapleader
let mapleader=","

" [,* ] Search and replace the word under the cursor
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" Make `Y` work from the cursor to the end of line (which is more logical)
nnoremap Y y$

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



" Load local machine settings if they exist
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
