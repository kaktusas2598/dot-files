"Enable all cool features
set nocompatible
" Use pathogen to include plugins to ~/.vim/bundle/
call pathogen#helptags()
call pathogen#infect()

"change mapleared from \ to ,
let mapleader=","
"Quickly edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent <leader>sv :so $MYVIMRC<CR>


set hidden "Hide buffers instead of closing

"set nowrap "don't wrap lines
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

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class "ignore some extensions
set title " change terminal's title
set visualbell "don't beep
set noerrorbells "don't beep

" no backups, use version control or something
set nobackup
set noswapfile

"intend intelligence based on syntax rules
filetype plugin indent on
"set file type specific settings
"only for python for now
if has('autocmd')
	autocmd filetype python set expandtab
endif
" Add syntax highlight and colorscheme
if &t_Co >= 256 || has("gui_running")
	colorscheme elflord
endif
if &t_Co > 2 || has("gui_running")
	"switch syntax highlight on, when terminal have colors
	syntax on
endif
