" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

if has("vms")
  set noundofile
else
  set undofile		" keep an undo file (undo changes after closing)
endif

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Use pathogen to include plugins to ~/.vim/bundle/
call pathogen#helptags()
call pathogen#infect()

"change mapleared from \ to ,
let mapleader=","
"Quickly edit/reload vimrc
nmap <silent><leader>ev :e $MYVIMRC<CR>
nmap <silent><leader>sv :so $MYVIMRC<CR>
"Disable search highlight
nmap <silent> ,/ :nohlsearch<CR>

"Easier Buffer switching
nmap <silent><leader>bn :bn<CR>
nmap <silent><leader>bp :bp<CR>

"Map window resizing to Alt+h,j,k,l
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>
"Terminals does not support <A-sth>, need to use <Esc> or ^[
map <silent> <Esc>h <C-w><
map <silent> <Esc>j <C-W>-
map <silent> <Esc>k <C-W>+
map <silent> <Esc>l <C-w>>

"Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Map ; to ex cmd mode
nnoremap ; :

"Always show status line(Includes airline show, if installed)
set laststatus=2

"folding settings
set foldmethod=syntax   "fold based on t
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

set relativenumber "Relative line numbering instead of absolute
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
set showmode "Show mode in status bar
set ignorecase "ignore case when searching
set smartcase "ignore case if pattern is all lower-case, case-sensitive otherwise
set smarttab "insert tabs on the start of line according to shiftwith
set hlsearch "highlight search terms
set incsearch "show search matches as you type
set ruler " show the cursor position all the time
set showcmd " display incomplete commands

"Open splits right and bottom
set splitbelow
set splitright

"Addirional syntax rules show tabs, trailing spaces...
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
"Dont need tab show in HTML, XML files
autocmd filetype html,xml,php set listchars-=tab:>.

"Toogle paste mode in insert mode(for pasting from elsewhere to vim)
set pastetoggle=<F2>

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class "ignore some extensions
set title " change terminal's title
set visualbell "don't beep
set noerrorbells "don't beep

" Dont like swaps, really ==>()
set noswapfile
set nobackup

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"Map Ctrl-n to NERDTree
map <C-n> :NERDTreeToggle<CR>
"Map Ctrl+t to TagBar
map <C-t> :TagbarToggle<CR>

"Close vim if only window is NERDTree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"intend intelligence based on syntax rules
filetype plugin indent on
"set file type specific settings
"only for python for now
if has('autocmd')
	autocmd filetype python set expandtab"TODO:add more
endif
" Add syntax highlight and colorscheme
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme jellybeans "solarized
syntax on

"Set autocomplete menu colors
highlight Pmenu ctermbg=8
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=0
"Window split colors
highlight VertSplit cterm=none gui=none 
"highlight StatusLineNC

"Vimdiff coloring
highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green gui=none guifg=bg guibg=Green
highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red gui=none guifg=bg guibg=Red
highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow gui=none guifg=bg guibg=Yellow
highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta gui=none guifg=bg guibg=Magenta
