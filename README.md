# Dot Files
 
  This is my Configuration files which I use for my daily development.
  
  ![vim](https://raw.githubusercontent.com/kaktusas2598/dot-files/master/vimSetup.png)
  ![nvim](https://raw.githubusercontent.com/kaktusas2598/dot-files/master/nVimSetup.png)

## Setup

  * Vim
  * NeoVim
  * tmux
  * bash, git, urxvt, etc.

## Installation
  
  ```
  $ git clone https://github.com/kaktusas2598/dot-files.git
  $ cd dot-files
  $ git submodule init
  $ git submodule update
  $ chmod +x install.sh
  $ ./install.sh # Optional, you can also simply drag dot files to your home directory
  ```
  Then first running vim, execute:
  ```
  :PlugInstall
  ```
  for vim-plug to install plugins.

## NVim instructions:

Simply copy files in nvim directory to:

* `~/.config/nvim` on Linux
* `%AppData%/Local/nvim/` on Windows
  
**Common Nvim/Vim Key mappings**

* '\<leader\>' - ','
* '\<leader\>bn' - next buffer
* '\<leader\>bp' - prev buffer
* '\<leader\>bd' - close buffer
* '\<leader\>n' - toggle file explorer
* '\<leader\>c\<space\>' - toggle comment
  
  
**Vim Plugins:**
  * [vim-plug](https://github.com/junegunn/vim-plug)
  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [Vim-Airline](https://github.com/bling/vim-airline)
  * [Syntastic](https://github.com/scrooloose/syntastic)
  * [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
  * [Tagbar](https://github.com/majutsushi/tagbar)
  * [Emmet](https://github.com/mattn/emmet-vim)
  * [ctrlp](https://github.com/kien/ctrlp.vim)
  * [MiniBufExpl](https://github.com/fholgado/minibufexpl.vim)
  * [surround.vim](https://github.com/tpope/vim-surround)
  * [fugitive.vim](https://github.com/tpope/vim-fugitive)
  * [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

**NeoVim Plugins**
  * TODO
 
**Colorschemes:**
  * [AwesomeColorschemes](https://github.com/rafi/awesome-vim-colorschemes)

## Dependencies
  * [Ctags](http://ctags.sourceforge.net/) - for tagbar to work.
  * [Git](https://git-scm.com/) - for vim-plug
  * [Python](https://www.python.org/) - for ulti-snip (currently removed, but you can add to yours)
  * [Patched Powerline Fonts](https://github.com/powerline/fonts)
  * [Lua](https://www.lua.org/)
