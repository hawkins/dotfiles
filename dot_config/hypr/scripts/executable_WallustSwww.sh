#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Wallust Colors for current wallpaper

# Define the path to the swww/awww cache directory
swww_cache="$HOME/.cache/swww"
awww_cache=$(ls -dt "$HOME/.cache/awww"/*/ 2>/dev/null | head -1)
if [ -d "$awww_cache" ]; then
    cache_dir="$awww_cache"
elif [ -d "$swww_cache" ]; then
    cache_dir="$swww_cache/"
else
    echo "No swww/awww cache directory found"
    exit 1
fi

# Initialize a flag to determine if the ln command was executed
ln_success=false

# Get current focused monitor
current_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')
echo $current_monitor
# Construct the full path to the cache file
cache_file="$cache_dir$current_monitor"
echo $cache_file
# Check if the cache file exists for the current monitor output
if [ -f "$cache_file" ]; then
    # Get the wallpaper path from the cache file (last field on the Lanczos3 line)
    wallpaper_path=$(strings "$cache_file" | tail -n 1)
    echo $wallpaper_path
    # symlink the wallpaper to the location Rofi can access
    if ln -sf "$wallpaper_path" "$HOME/.config/rofi/.current_wallpaper"; then
        ln_success=true  # Set the flag to true upon successful execution
    fi
    # copy the wallpaper for wallpaper effects
	cp -r "$wallpaper_path" "$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"
fi

# Check the flag before executing further commands
if [ "$ln_success" = true ]; then
    # execute wallust
	echo 'about to execute wallust'
    # execute wallust
    wallust run "$wallpaper_path" &
fi
