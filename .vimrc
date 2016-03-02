" PLUGIN USE
" To use Emmet for Html expansion, write expansion and use <C-y>, to expand it!!
" For Toggle comments with NerCommenter use <leader>cc
" Toggling NERDTree: <C-n>
" Toggling Tagbar(Needs ctags to work!!): <C-t>

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"Source syntax, colorschemes and plugins in windows gvim
"Don't forget to put .vimrc and .vim in $HOME!!
if has('win32') || has('win64')
  let &runtimepath.=',$HOME/.vim/'
endif

"if has ("vms") - doesnt work?
set noundofile

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" LOAD PLUGINS
call plug#begin('~/.vim/plugged')
" Group dependencies, vim-snippets depends on ultisnips
" Causes problems: does not find Python interpreter
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" " On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" KEY MAPPINGS
"change mapleared from \ to ,
let mapleader=","
"Quickly edit/reload vimrc
nmap <silent><leader>ev :e $MYVIMRC<CR>
nmap <silent><leader>sv :so $MYVIMRC<CR>
"Disable search highlight
nmap <silent> ,/ :nohlsearch<CR>
"Can now cancel search by escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

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

"Map Ctrl-n to NERDTree
map <C-n> :NERDTreeToggle<CR>
"Map Ctrl+t to TagBar
map <C-t> :TagbarToggle<CR>

"Enable mouse scrolling
set mouse=a

"Always show status line(Includes airline show, if installed)
set laststatus=2

"Use utf-8 encoding
set encoding=utf8

"folding settings
set foldmethod=syntax   "fold based on t
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

"Default startup size
set lines=30 columns=120
set relativenumber "Relative line numbering instead of absolute
set hidden "Hide buffers instead of closing
set nowrap "don't wrap lines
set tabstop=4 "a tab is four spaces
set backspace=2
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

"Additional syntax rules show tabs, trailing spaces...
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"Dont need tab show in HTML, XML files
"autocmd filetype html,xml,php,cpp set listchars-=tab:>.

"Toogle paste mode in insert mode(for pasting from elsewhere to vim)
set pastetoggle=<F2>

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class "ignore some extensions
set title " change terminal's title
"set visualbell "don't beep !Bug here on Linux
set noerrorbells "don't beep

" Dont like swaps, really ==>()
set noswapfile
set nobackup



" AUTO COMMANDS
"Close vim if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" AIRLINE SETTINGS
"Use patched powerline fonts for airline and enable smart tab show in top
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" SYNTASTIC SETTINGS
"Set php chechers
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

"intend intelligence based on syntax rules
filetype plugin indent on
"set file type specific settings
"only for python for now
if has('autocmd')
	autocmd filetype python set expandtab"TODO:add more
endif

" VIM LOOKS
" Add syntax highlight and colorscheme
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme jellybeans "solarized molokai
syntax on

"Set fonts
if has("gui_running")
  "Start gui minimal with no scrollbar, toolbar or menu
  set go -=T
  set go -=m
  set go -=r
  if has("gui_win32")
    "set guifont=Consolas:h11:cANSI Default
    "Patched powerline font
    set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
  endif
endif

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
