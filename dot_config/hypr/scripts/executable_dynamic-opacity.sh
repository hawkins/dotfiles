#!/bin/bash
# Listens to Hyprland window title events and forces full opacity on browser windows
# when they are showing video streaming content, restoring transparency otherwise.

VIDEO_TITLES=(
    "Twitch"
    "YouTube"
    "Netflix"
    "Hulu"
    "Prime Video"
    "Amazon Prime Video"
    "Disney+"
    "Max"
    "HBO Max"
    "Peacock"
    "Paramount+"
    "Apple TV+"
    "ESPN+"
    "Crunchyroll"
    "Funimation"
    "MUBI"
    "Tubi"
    "Pluto TV"
    "Plex"
    "Jellyfin"
    "Emby"
    "SkyShowtime"
    "discovery+"
    "BritBox"
    "Shudder"
    "AMC+"
    "Starz"
    "Showtime"
)

declare -A window_opacity_state

is_video_title() {
    local title="$1"
    for pattern in "${VIDEO_TITLES[@]}"; do
        [[ "$title" == *"$pattern"* ]] && return 0
    done
    return 1
}

set_window_opacity() {
    local address="$1"
    local title="$2"

    [[ -z "$address" || "$address" == "null" || -z "$title" ]] && return

    if is_video_title "$title"; then
        if [[ "${window_opacity_state[$address]}" != "opaque" ]]; then
            hyprctl -q dispatch setprop "address:$address" opaque true 2>/dev/null
            window_opacity_state[$address]="opaque"
        fi
    else
        if [[ "${window_opacity_state[$address]}" == "opaque" ]]; then
            hyprctl -q dispatch setprop "address:$address" opaque false 2>/dev/null
            window_opacity_state[$address]="normal"
        fi
    fi
}


handle_active_window() {
    local json
    json=$(hyprctl -j activewindow 2>/dev/null)
    local address title
    address=$(printf '%s' "$json" | jq -r '.address // ""')
    title=$(printf '%s' "$json" | jq -r '.title // ""')
    set_window_opacity "$address" "$title"
}

# Single-instance enforcement via PID file
PIDFILE="/tmp/dynamic-opacity-${HYPRLAND_INSTANCE_SIGNATURE}.pid"
if [[ -f "$PIDFILE" ]]; then
    old_pid=$(cat "$PIDFILE")
    kill "$old_pid" 2>/dev/null
fi
echo $$ > "$PIDFILE"
trap 'rm -f "$PIDFILE"' EXIT

# Initial check on the currently active window
handle_active_window

SOCKET2="${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock"

# Event loop
python3 -c "
import socket, sys
s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
s.connect(sys.argv[1])
buf = b''
while True:
    data = s.recv(4096)
    if not data: break
    buf += data
    while b'\n' in buf:
        line, buf = buf.split(b'\n', 1)
        print(line.decode('utf-8', errors='replace'), flush=True)
" "${SOCKET2}" | \
while IFS= read -r event; do
    event_type="${event%%>>*}"
    event_data="${event#*>>}"

    case "$event_type" in
        activewindow|windowtitle|windowtitlenv2)
            handle_active_window
            ;;
        closewindow)
            unset "window_opacity_state[$event_data]"
            ;;
    esac
done
