#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */
# Rofi prompt to set the office curtain to a percentage closed (0 = open, 100 = closed)

# Variables
rofi_theme="$HOME/.config/rofi/config-curtain.rasi"
switchbot="/home/josh/.nvm/versions/node/v22.18.0/bin/switchbot"
device="Office curtain"

# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
fi

# Empty stdin: rofi only collects the typed text, Enter returns it
result=$(
    rofi -dmenu \
        -config "$rofi_theme" \
        -mesg "Enter how far to close the curtain: 0 = open, 100 = closed" \
        < /dev/null
) || exit

# Accept "70" or "70%"
value=${result//[[:space:]%]/}

if ! [[ $value =~ ^[0-9]+$ ]] || (( value > 100 )); then
    notify-send -u critical "Office curtain" "'$result' is not a percentage from 0 to 100"
    exit 1
fi

# Run in the background so this script and its rofi window leave focus on the previous window
(
    if ! "$switchbot" devices expand --name "$device" setPosition --position "$value" >/dev/null 2>&1; then
        notify-send -u critical "Office curtain" "Failed to set position to $value%"
    fi
) &

exit
