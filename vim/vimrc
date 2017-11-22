" -----------------------------------------------------------------------
" General Settings
" -----------------------------------------------------------------------

" Don't make vim vi-compatibile.
set nocompatible

" Enable syntax highlighting.
syntax on

if has('autocmd')
	filetype plugin indent on
	"         [1]    [2]  [3]
	"
	" 1. Enable loading of plugin files.
	" 2. Enable loading of indent file.
	" 3. Enable file type detection.
endif

" Copy indent to the new line.
set autoindent

" Allow `backspace` in insert mode.
set backspace=indent
set backspace+=eol
set backspace+=start

" Set directory for backup files.
set backupdir=~/.vim/backups

" Don't create backups for certain files.
set backupskip=/tmp/*
set backupskip+=/private/tmp/*

" Use the system clipboard as the default register.
set clipboard=unnamed
if has('unnamedplus')
	set clipboard+=unnamedplus
endif

" When making a change, don't redisplay the line, and instead, put a
" `$` sign at the end of the changed text.
set cpoptions+=$

" Highlight certain column(s).
set colorcolumn=73

" Highlight the current line.
set cursorline

" Set directory for swap files.
set directory=~/.vim/swaps

" Use UTF-8 without BOM.
set encoding=utf-8 nobomb

" Use UTF-8.
set fileencoding=utf-8

" Increase command line history.
set history=5000

" Enable search highlighting.
set hlsearch

" Ignore case in search patterns.
set ignorecase

" Highlight search pattern as it is being typed.
set incsearch

" Always show the status line.
set laststatus=2

" Do not redraw the screen while executing macros, registers and other
" commands that have not been typed.
set lazyredraw

"  Use custom symbols to represent invisible characters.
set listchars=tab:→→
set listchars+=trail:·
set listchars+=eol:↴
set listchars+=nbsp:_

" Enable extended regexp.
set magic

" Enable mouse in all modes.
set mouse=a

" Hide mouse pointer while typing.
set mousehide

" Disable error bells.
set noerrorbells

" When using the join command, only insert a single space
" after a `.`, `?`, or `!`.
set nojoinspaces

" Kept the cursor on the same column.
set nostartofline

" Show line number.
set number

" Increase the minimal number of columns used for the `line number`.
set numberwidth=5

" Report the number of lines changed.
set report=0

" Show cursor position.
set ruler

" When scrolling, keep the cursor 5 lines below the top and 5 lines
" above the bottom of the screen.
set scrolloff=5

" Avoid all the hit-enter prompts.
set shortmess=aAItW

" Show the command being typed.
set showcmd

" Show current mode.
set showmode

" Show matching parens, brackets, etc.
set showmatch

" Set the spell-check language.
set spelllang=en_gb

" Override `ignorecase` option if the search pattern
" contains uppercase characters.
set smartcase

" Limit syntax highlighting (this avoids the very slow redrawing
" when files contain long lines).
set synmaxcol=2500

" Set global <TAB> settings
" http://vimcasts.org/e/2
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Indent using tab characters (Indent using spaces set expandtab).
set noexpandtab

" Smart indents
set smartindent
set smarttab

" Don't wrap lines
set nowrap

" Wrap lines at convenient points
set linebreak

" Enable fast terminal connection.
set ttyfast

" Set directory for undo files.
set undodir=~/.vim/undos

" Automatically save undo history.
set undofile

" Allow cursor to be anywhere.
set virtualedit=all

" Disable beeping and window flashing
" https://vim.wikia.com/wiki/Disable_beeping
set visualbell
set noerrorbells
set t_vb=

" Enable enhanced command-line completion (by hitting <TAB> in
" command mode, Vim will show the possible matches just above the
" command line with the first match highlighted).
set wildmenu

" Don’t offer to open certain files/directories
set wildignore+=*.gif,*.jpg
set wildignore+=*.png
set wildignore+=node_modules/*

" Allow windows to be squashed.
set winminheight=0


" -----------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------

" Use minpac to package manage the Vim plugins.
" http://vimcasts.org/episodes/minpac/

" -----------------------------------------------------------------------

" Include and initialize minpac.

packadd minpac
call minpac#init()

" -----------------------------------------------------------------------

" List of plugins to be installed.

call minpac#add('k-takata/minpac', {'type':'opt'})

call minpac#add('altercation/vim-colors-solarized')
call minpac#add('isRuslan/vim-es6')
call minpac#add('jelera/vim-javascript-syntax')
call minpac#add('mhinz/vim-signify')
call minpac#add('scrooloose/nerdtree')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('shougo/neocomplcache.vim')

" -----------------------------------------------------------------------

" Commands for updating and removing plugins.

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


" -----------------------------------------------------------------------
" Plugins - NeoComplCache
" -----------------------------------------------------------------------

" Enable `neocomplcache` by default.
" https://github.com/Shougo/neocomplcache.vim#installation

let g:neocomplcache_enable_at_startup=1

" -----------------------------------------------------------------------

" Make `Tab` autocomplete.

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


" -----------------------------------------------------------------------
" Plugins - Signify
" -----------------------------------------------------------------------

" Disable Signify by default.
" https://github.com/mhinz/vim-signify

let g:signify_disable_by_default=1


" -----------------------------------------------------------------------
" Helper Functions
" -----------------------------------------------------------------------

function! StripTrailingWhitespaces()

	" Save last search and cursor position.

	let searchHistory = @/
	let cursorLine = line('.')
	let cursorColumn = col('.')

	" Strip trailing whitespaces.

	%s/\s\+$//e

	" Restore previous search history and cursor position.

	let @/ = searchHistory
	call cursor(cursorLine, cursorColumn)

endfunction

" -----------------------------------------------------------------------

function! ToggleLimits()

	" [51,73]
	"  - git commit message
	"     http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
	" [81]
	"  - general use

	if (&colorcolumn == '73')
		set colorcolumn+=51,81
	else
		set colorcolumn-=51,81
	endif

endfunction

" -----------------------------------------------------------------------

function! ToggleRelativeLineNumbers()
	if (&relativenumber == 1)
		set number
		set norelativenumber
	else
		set number
		set relativenumber
	endif
endfunction


" -----------------------------------------------------------------------
" Automatic Commands
" -----------------------------------------------------------------------

if has('autocmd')

	" Autocommand Groups.
	" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html

	" -------------------------------------------------------------------

	" Automatically reload the configurations from
	" the `~/.vimrc` file whenever they are changed.

	augroup auto_reload_vim_configs

		autocmd!
		autocmd BufWritePost vimrc source $MYVIMRC

	augroup END

	" -------------------------------------------------------------------

	" Use relative line numbers.
	" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/

	augroup relative_line_numbers

		autocmd!

		" Automatically switch to absolute
		" line numbers when Vim loses focus.

		autocmd FocusLost * :set number norelativenumber

		" Automatically switch to relative
		" line numbers when vim gains focus.

		autocmd FocusGained * :set relativenumber

		" Automatically switch to absolute
		" line numbers when vim is in insert mode.

		autocmd InsertEnter * :set number norelativenumber

		" Automatically switch to relative
		" line numbers when vim is in normal mode.

		autocmd InsertLeave * :set relativenumber

	augroup END

	" -------------------------------------------------------------------

	" Automatically strip the trailing
	" whitespaces when files are saved.

	augroup strip_trailing_whitespaces

		" List of file types that use the trailing whitespaces:
		"
		" * Markdown
		"   https://daringfireball.net/projects/markdown/syntax#block

		let excludedFileTypes = [
			\ 'markdown',
			\ 'mkd.markdown'
		\]

		" Only strip the trailing whitespaces if
		" the file type is not in the excluded list.

		autocmd!
		autocmd BufWritePre * if index(excludedFileTypes, &ft) < 0 | :call StripTrailingWhitespaces()

	augroup END

endif


" -----------------------------------------------------------------------
" Color Scheme
" -----------------------------------------------------------------------

" Enable full-color support.
set t_Co=256

 " Use colors that look good on a dark background.
set background=dark

" Set custom configurations for when the
" Solarized theme is used from Vim's Terminal mode.
"
" http://ethanschoonover.com/solarized/vim-colors-solarized#advanced-configuration

if !has("gui_running")
    let g:solarized_contrast = "high"
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    let g:solarized_visibility = "high"
endif

 " Use custom color scheme.
colorscheme solarized


" -----------------------------------------------------------------------
" Key Mappings
" -----------------------------------------------------------------------

" Use a different mapleader (default is '\').

let mapleader = ','

" -----------------------------------------------------------------------

" Make `Y` work from the cursor to end of line.

nmap Y y$

" -----------------------------------------------------------------------

" [,* ] Search and replace the word under the cursor.

nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" -----------------------------------------------------------------------

" clear highlights by hitting [esc]
" or by hitting [enter] in normal mode

nnoremap <CR> :noh<CR><CR>

" -----------------------------------------------------------------------

" [,cs] Clear search.

map <leader>cs <Esc>:noh<CR>

" -----------------------------------------------------------------------

" [,gd] Toggle Git differences.

map <leader>gd :SignifyToggle<CR>

" -----------------------------------------------------------------------

" [,l ] Toggle `set list`.

nmap <leader>l :set list!<CR>

" -----------------------------------------------------------------------

" [,n ] Toggle `set relativenumber`.

nmap <leader>n :call ToggleRelativeLineNumbers()<CR>

" -----------------------------------------------------------------------

" [,sc] Toggle spellcheck.

map <leader>sc :setlocal spell!<CR>

" -----------------------------------------------------------------------

" [,ss] Strip trailing whitespace.

nmap <leader>ss :call StripTrailingWhitespaces()<CR>

" -----------------------------------------------------------------------

" [,t ] Toggle NERDTree.

map <leader>t :NERDTreeToggle<CR>

" -----------------------------------------------------------------------

" [,tl] Toggle show limits.

nmap <leader>tl :call ToggleLimits()<CR>

" -----------------------------------------------------------------------

" [,v ] Make the opening of the `.vimrc` file easier.

nmap <leader>v :vsp $MYVIMRC<CR>

" -----------------------------------------------------------------------

" [,W ] Sudo write.

map <leader>W :w !sudo tee %<CR>

" -----------------------------------------------------------------------
" Status Line
" -----------------------------------------------------------------------

" Terminal types:
"
"  1. term  (normal terminals, e.g.: vt100, xterm)
"  2. cterm (color terminals, e.g.: MS-DOS console, color-xterm)
"  3. gui   (GUIs)

highlight ColorColumn
    \ term=NONE
    \ cterm=NONE  ctermbg=237    ctermfg=NONE
    \ gui=NONE    guibg=#073642  guifg=NONE

highlight CursorLine
    \ term=NONE
    \ cterm=NONE  ctermbg=237    ctermfg=NONE
    \ gui=NONE    guibg=#073642  guifg=NONE

highlight CursorLineNr
    \ term=bold
    \ cterm=bold  ctermbg=NONE   ctermfg=178
    \ gui=bold    guibg=#073642  guifg=Orange

highlight LineNr
    \ term=NONE
    \ cterm=NONE  ctermfg=241    ctermbg=NONE
    \ gui=NONE    guifg=#839497  guibg=#073642

highlight User1
    \ term=NONE
    \ cterm=NONE  ctermbg=237    ctermfg=Grey
    \ gui=NONE    guibg=#073642  guifg=#839496

set statusline=
set statusline+=%1*                           " User1 highlight
set statusline+=\ [%n]                        " Buffer number
set statusline+=\ [%f]                        " Path to the file
set statusline+=%m                            " Modified flag
set statusline+=%r                            " Readonly flag
set statusline+=%h                            " Help file flag
set statusline+=%w                            " Preview window flag
set statusline+=%y                            " File type
set statusline+=[
set statusline+=%{&ff}                        " File format
set statusline+=:
set statusline+=%{strlen(&fenc)?&fenc:'none'} " File encoding
set statusline+=]
set statusline+=%=                            " Left/Right separator
set statusline+=%c                            " File encoding
set statusline+=,
set statusline+=%l                            " Current line number
set statusline+=/
set statusline+=%L                            " Total number of lines
set statusline+=\ (%P)\                       " Percent through file

" Preview:
"
" [1] [vim/vimrc][vim][unix:utf-8]            17,238/381 (59%)
