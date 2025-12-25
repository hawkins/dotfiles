#!/bin/bash

SELECTION=$(zenity --file-selection --title="Choose a new wallpaper" --file-filter="Image files | *.jpg *.jpeg *.png *.webp")

echo "selected: $SELECTION"

if [ -z "$SELECTION" ]; then
    echo "No wallpaper chosen"
fi

$(dirname "$0")/wallpaper.sh "$SELECTION"