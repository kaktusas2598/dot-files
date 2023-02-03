#!/bin/bash

# I wish I could use rust and cargo on WSL as well, but I am getting weird errors and
# RUST doesn't seem to be working fine for WSL
. "$HOME/.cargo/env"
export PATH=~/.cargo/bin:$PATH