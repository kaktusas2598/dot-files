# Dot Files

  This is my Configuration files which I use for my daily development.

  ![vim](https://raw.githubusercontent.com/kaktusas2598/dot-files/master/vimSetup.png)
  ![nvim](https://raw.githubusercontent.com/kaktusas2598/dot-files/master/nVimSetup.png)

## My Setup

  * **CLI**
    * Editors: Vim and NeoVim(>=0.80)
    * Shell: bash
    * Multiplexer: Tmux
    * VS: Git
    * Terminal configs: urxvt, kitty, alacritty
    * File manager: Ranger
  * **GUI**
    * Window manager: i3wm (>=4.22 for gap support)
    * Application launcher: rofi
    * Status bars: i3bar(using i3blocks) or polybar (>=3.60 for better network module)
    * Notification daemon: dunst
    * Gruvbox GTK [Theme](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme)

## Installation

### Supported environments

- Ubuntu
- MSYS2 (Windows)
- WSL2 (Debian 11)

### Install Dependencies

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)
- i3 dependencies:
  - [Rofi](https://github.com/davatorium/rofi) for additional themes see [this](https://github.com/newmanls/rofi-themes-collection)
  - [picom](https://github.com/yshui/picom) or [compton](https://github.com/chjj/compton)
  - [i3blocks](https://github.com/vivien/i3blocks) or/and [polybar](https://github.com/polybar/polybar)
  - [scrot](https://github.com/dreamer/scrot) and [imagemagick](https://imagemagick.org/index.php) for blurred lock screen effect
  - [dunst](https://github.com/dunst-project/dunst)

### Install instruction

  Clone repo in home directory:
  ```
  $ cd
  $ git clone https://github.com/kaktusas2598/dot-files.git
  ```
  1. Install all modules at once
  ```
  $ cd dot-files
  $ ./install.sh # Optional, you can also simply drag dot files to your home directory
  ```
  2. Or alternatively if you want to install only certain module, use:
  ```
  $ cd dot-files
  $ stow vim
  $ stow bash
  ```

### Font Installation

1. curl required font
2. tar xcvf font.tar.gz
3. mkdir ~/.local/share/fonts if it doesn't exist
4. move font binaries to this directory
5. Clear & regenerate font cache:
    `fc-cache -f -v`
6. Verify:
    `fc-list | grep "FontName"`

## Vim/NeoVim

**Common Nvim/Vim Key mappings**

* '\<leader\>' - ','
* '\<leader\>bn' - next buffer
* '\<leader\>bp' - prev buffer
* '\<leader\>bd' - close buffer
* '\<leader\>w' - write buffer
* '\<leader\>q' - quit vim/nvim
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
  * [Patched Powerline Fonts](https://github.com/powerline/fonts) - Or can use NERD fonts
  * [Lua](https://www.lua.org/)
  * [ripgrep](https://github.com/BurntSushi/ripgrep)
  * [fd](https://github.com/sharkdp/fd)

## TODO

  * **CLI**
    * Setup neovim php and c++ debugging using nvim-dap
    * Setup more themes for all tools: dracula, tomorrow night, monokai for example
  * **GUI**
    * Setup rofi-themes-collection installation
    * Wallpaper rotation
    * Weather service
    * Setup sound and brightness notifications

