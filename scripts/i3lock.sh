#!/bin/bash

# Dependencies:
# imagemagick
# i3lock
# maim

# TODO: does not do what I want: after locking screen, rofi should disappear before taking screenshot so that
# lock screen does not display rofi
xdotool key Escape

IMAGE=/tmp/i3lock.png
SCREENSHOT="maim $IMAGE"
#maim -u --window $(xdotool getactivewindow) | tee ~/Pictures/screenshot-"$(date '+%y%m%d-%H%M-%S').png" | xclip -sel c -t image/png

# Alternate screenshot method with imagemagick. NOTE: it is much slower
# SCREENSHOT="import -window root $IMAGE" # 1.35s

# Here are some imagemagick blur types
# Uncomment one to use, if you have multiple, the last one will be used

# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
#BLURTYPE="5x2" # 3.80s
BLURTYPE="2x8" # 2.90s
#BLURTYPE="2x3" # 2.92s

# Get the screenshot, add the blur and lock the screen with it
$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
i3lock -i $IMAGE
rm $IMAGE

