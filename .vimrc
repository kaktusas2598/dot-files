" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=500
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"Enable all cool features
set nocompatible
" Use pathogen to include plugins to ~/.vim/bundle/
call pathogen#helptags()
call pathogen#infect()

"change mapleared from \ to ,
let mapleader=","
"Quickly edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent><leader>sv :so $MYVIMRC<CR>

"Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set hidden "Hide buffers instead of closing
set nowrap "don't wrap lines
set tabstop=4 "a tab is four spaces
set backspace=indent,eol,start "allow backspacing over anything in insert mode
set autoindent
set copyindent "copy previous indentation on autoindeting
set number
set shiftwidth=4 "number of spaces for autoindent
set shiftround "use multiple of shiftwidth when indenting with '<' and '>'
set showmatch " show matching parentheses
set ignorecase "ignore case when searching
set smartcase "ignore case if pattern is all lower-case, case-sensitive otherwise
set smarttab "insert tabs on the start of line according to shiftwith
set hlsearch "highlight search terms
set incsearch "show search matches as you type

"Addirional syntax rules show tabs, trailing spaces...
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class "ignore some extensions
set title " change terminal's title
set visualbell "don't beep
set noerrorbells "don't beep

" Dont like swaps, really ==>()
set noswapfile

"set file type specific settings
"only for python for now
if has('autocmd')
	autocmd filetype python set expandtab"TODO:add more
endif
" Add syntax highlight and colorscheme
if &t_Co >= 256 || has("gui_running")
	colorscheme elflord
endif
if &t_Co > 2 || has("gui_running")
	"switch syntax highlight on, when terminal have colors
	syntax on
endif
