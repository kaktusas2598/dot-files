#!/bin/bash

# Settings for WSL2 Gui support, don't forget to install XServer on windows
export DISPLAY=localhost:0
export PATH=~/.local/kitty.app/bin:"$PATH"
# To fix WSL2 Perl locale warnings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Fuzzy finder bash completion
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash

# Add Go to path (for system-wide is should go in /etc/profile)
export PATH=$PATH:/usr/local/go/bin

# Open selected dir using windows explorer, or open explorer in current dir if no arguments are supplied
function open() {
    if [ $# -eq 0 ]; then
        explorer.exe $(wslpath -w $(pwd))
    else
        # cmd's start probably good enough for images
        #cmd.exe /C start <file>
        explorer.exe $(wslpath -w $rPath)
    fi
}
