#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for Random Wallpaper ( CTRL ALT W)

wallDIR="$HOME/Pictures/wallpapers"
SCRIPTSDIR="$HOME/.config/hypr/scripts"

focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

PICS=($(find -L ${wallDIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.pnm" -o -name "*.tga" -o -name "*.tiff" -o -name "*.webp" -o -name "*.bmp" -o -name "*.farbfeld" -o -name "*.gif" \)))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

#source "$HOME/.config/hypr/UserScripts/WallpaperSelect.sh"
#apply_image_wallpaper "$RANDOMPICS"
#exit


# Transition config
FPS=60
TYPE="random"
DURATION=2
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"


#swww query || swww-daemon --format xrgb && swww img -o $focused_monitor "${RANDOMPICS}" $SWWW_PARAMS
#sleep 2

#swww-daemon --format xrgb && swww img -o "$focused_monitor" "${RANDOMPICS}" $SWWW_PARAMS
#"$SCRIPTSDIR/WallustSwww.sh"

if ! pgrep -x "swww-daemon" >/dev/null; then
  echo "Starting swww-daemon..."
  swww-daemon --format xrgb &
fi


echo "swww"
swww img -o "$focused_monitor" "${RANDOMPICS}" $SWWW_PARAMS
wait $!
echo "WallustSwww.sh"
"$SCRIPTSDIR/WallustSwww.sh"

# Run additional scripts
#sleep 2
echo "wallpaper.sh"
~/.config/hyprland-de/scripts/wallpaper.sh "${RANDOMPICS}"
echo "Refresh.sh"
"$SCRIPTSDIR/Refresh.sh" &
sleep 1


exit


wait $!
"$SCRIPTSDIR/WallustSwww.sh" &&

wait $!
sleep 2
"$SCRIPTSDIR/Refresh.sh"

