#!/bin/bash
#==========================================
# Title:  Firefox Bookmark Dmenu Launcher
# Author: madvi11ain
# Date:   16 Feb 2023
#==========================================

## Codes
# Reset
CodeOff='\033[0m'       # Text Reset
# Regular Colors
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'
# Bold
BBlack='\033[1;30m'

# Check Dependencies
if ! command -v firefox >/dev/null 2>&1 ; then
    echo "firefox not found"
    exit 1
fi

if ! command -v sqlite3 >/dev/null 2>&1 ; then
    echo "sqlite3 not found"
    exit 1
fi

if ! command -v dmenu >/dev/null 2>&1 ; then
    echo "dmenu not found"
    exit 1
fi

PLACES_LOOKUP=~/.mozilla/
# Check if firefox was installed using snap, shame user
if command -v snap >/dev/null 2>&1 ; then
    if snap list firefox; then
        echo -e "${Red}Firefox was installed using snap, what is wrong with you?${CodeOff}"
        PLACES_LOOKUP=~/snap/
    fi
fi

# Check if windows
if command -v wsl.exe >/dev/null 2>&1 ; then
    PLACES_LOOKUP=$(wslpath $APPDATA)/Mozilla/Firefox/Profiles/
    echo $PLACES_LOOKUP
fi

# Find location of main firefox places db
PLACES_DB=$(find $PLACES_LOOKUP -name places.sqlite)

# places.sqlite must be copied mainly for 2 reasons:
#   1. To avoid corruption of firefox's data
#   2. DB will be locked if firefox is opened
cp $PLACES_DB /tmp/places.sqlite

echo -e "Firefox stored your history and bookmarks in: ${BBlack}$PLACES_DB${CodeOff}"

#echo "Here are the tables stored by firefox:"
#sqlite3 /tmp/places.sqlite ".tables"

# moz_bookmarks.type: 1 - url, 2 - folder/parent
SQL="select folders.title, bookmarks.title, moz_places.url
                       from moz_places, moz_bookmarks as bookmarks
                       left join moz_bookmarks as folders on folders.id = bookmarks.parent
                       where bookmarks.fk = moz_places.id
                       and bookmarks.type = 1 and folders.type = 2
                       and length(bookmarks.title) > 0
                       order by bookmarks.dateAdded;"

#HISTLIST=$(printf '%s\n' "$(sqlite3 "/tmp/places.sqlite" "${SQL}")")
HISTLIST=$(sqlite3 -separator "|" "/tmp/places.sqlite" "${SQL}")

# TODO: WSL, need x server for dmenu or maybe find an alternative for windows

# Import mozilla bookmarks to nb, time consuming
#IFS=$'\n'
#BM_ARRAY=(`sqlite3 -separator "|" "/tmp/places.sqlite" "${SQL}"`)
#for bookmark in "${BM_ARRAY[@]}"; do
    #TAG=$(echo "${bookmark}" | awk -F '|' '{print $1}')
    #URL=$(echo "${bookmark}" | awk -F '|' '{print $NF}')
    ##echo "Tag: $TAG, Url: $URL"
    #nb $URL -t $TAG
#done

# Simple, use dmenu:
#CHOICE=$(printf '%s\n' "${HISTLIST}" | dmenu -i -l 20 -p "Firefox open:" | awk -F'|' '{print $NF}')

# Or for better styling options, use rofi:
#ROFI_THEME="$HOME/.config/rofi/launchers/type-6/style-5.rasi"# To use theme: rofi -theme ${ROFI_THEME}
CHOICE=$(printf '%s\n' "${HISTLIST}" | rofi -dmenu -i -l 20 -p "Firefox open:" | awk -F'|' '{print $NF}')

echo $CHOICE
[[ $CHOICE = "" ]] && exit 1

# TODO: firefox.exe on wsl, assuming we can subtitute dmenu for something
firefox $CHOICE
