#!/bin/bash

. ~/.local/share/hyprland-de/token

if [ "$(($HLA_LAST_REFRESH + 600))" -gt "$(date +%s)" ]; then
    # nothing to do
    exit 0
fi

CURL_RESULT=$(curl -sSL -X POST 'https://account.hypr.land/api/v1/rotate_token' --data "{\"data\":\"$HLA_TOKEN\"}")
CALL_RESULT=$(echo $CURL_RESULT | jq '.success')

if [ "$CALL_RESULT" = "false" ]; then
    echo -ne "Invalid token."
    rm ~/.local/share/hyprland-de/token
    exit 1
fi

# got new token
CALL_RESULT=$(echo $CURL_RESULT | jq '.message')

mkdir -p ~/.local/share/hyprland-de/
echo -ne "#!/bin/sh\n# Do not share this token with anyone.\nHLA_TOKEN=$CALL_RESULT\nHLA_LAST_REFRESH=$(date +%s)\n" > ~/.local/share/hyprland-de/token
