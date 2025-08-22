#!/bin/bash

$(dirname "$0")/refresh.sh

. ~/.local/share/hyprland-de/token

HLDE_EPOCH=$($(dirname "$0")/checkUpdates.sh | jq '.epoch_seconds')

bash -c "$(curl -fsSL https://dl.hypr.land/desktop/update.sh)"

nohup bash -c "sleep 4 ; qs msg update updated $HLDE_EPOCH" >&/dev/null &

