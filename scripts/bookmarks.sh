#!/bin/bash
#==========================================
# Title:  Web Browser Data Extractor
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

# Find location of main firefox places db
PLACES_DB=$(find $PLACES_LOOKUP -name places.sqlite)

echo -e "Firefox stored your history and bookmarks in: ${BBlack}$PLACES_DB${CodeOff}"

echo "Here are the tables stored by firefox:"
sqlite3 $PLACES_DB ".tables"

sqlite3 $PLACES_DB "select moz_places.url, moz_bookmarks.title
                       from moz_places, moz_bookmarks
                       where moz_bookmarks.fk = moz_places.id
                       and moz_bookmarks.type = 1
                       and length(moz_bookmarks.title) > 0
                       order by moz_bookmarks.dateAdded"

