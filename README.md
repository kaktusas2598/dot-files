# Dot Files

  This is my Configuration files which I use for my daily development.

  ![setup](https://raw.githubusercontent.com/kaktusas2598/dot-files/master/setup.png)
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
    * Notification daemon: dunst (>= 1.9.0 for better geometry)
    * Gruvbox GTK [Theme](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme)

## Installation

### Supported environments

- Ubuntu
- MSYS2 (Windows)
- WSL2 (Debian 11)

### Install Dependencies

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)
- [Starship](https://starship.rs/)
- i3 dependencies:
  - [Rofi](https://github.com/davatorium/rofi) for additional themes see [this](https://github.com/newmanls/rofi-themes-collection) and [this](https://github.com/adi1090x/rofi)
  - [picom](https://github.com/yshui/picom) or [compton](https://github.com/chjj/compton)
  - [i3blocks](https://github.com/vivien/i3blocks) or/and [polybar](https://github.com/polybar/polybar)
  - [maim](https://github.com/naelstrof/maim) and [imagemagick](https://imagemagick.org/index.php) for blurred lock screen effect and screenshots
  - [dunst](https://github.com/dunst-project/dunst)
  - [light](https://github.com/haikarainen/light) - Don't forget to "sudo usermod -a -G video ${USER}"!
  - Python dbus module for playerctl support with spotify: ```pip install dbus-python```, to control media players, especially spotify on polybar
  - network-manager-applet (or nm-applet) for wifi/network popup in polybar
  - [pulsemixer](https://github.com/GeorgeFilipkin/pulsemixer) - to control sounds on polybar
  - [yad](https://github.com/v1cont/yad) - yet another dialog tool, used by status bar to display calendar

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

## CLI Dependencies
  * [Git](https://git-scm.com/)
  * [Lua](https://www.lua.org/)
  * [Python](https://www.python.org/)
  * [NERD Fonts](https://github.com/ryanoasis/nerd-fonts) and [Noto Emoji font](https://github.com/googlefonts/noto-emoji)
  * [ripgrep](https://github.com/BurntSushi/ripgrep)
  * [fd](https://github.com/sharkdp/fd)
  * [bat](https://github.com/sharkdp/bat) - used by ranger in file preview
  * [fzf](https://github.com/junegunn/fzf)
  * [Ctags](http://ctags.sourceforge.net/) - for Vim/NVim tags

## TODO

  * **CLI**
    * Setup more themes for all tools: dracula, tomorrow night, monokai for example
  * **GUI**
    * Wallpaper rotation
    * Setup sound and brightness notifications

