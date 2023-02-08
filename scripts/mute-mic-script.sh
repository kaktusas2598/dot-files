#!/bin/bash

if [[ $(pulsemixer --list-sources | grep 'Mute: 1') ]]; then
    echo "  OFF"
else
    echo ''
fi
