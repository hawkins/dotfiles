#!/bin/bash

echo -ne "\n\n\n\nPlease log into your Hyprland Account:\n"
read -p "Username: " UNAME
echo -ne "Password: "
read -s PASSWD
echo
read -p "2FA code, if you have 2FA: " TOTP

CURL_RESULT=$(curl -sSL -X POST 'https://account.hypr.land/api/v1/login' --data "{\"username\":\"$UNAME\", \"password\":\"$PASSWD\", \"totp\": \"$TOTP\", \"desktop\":true}")
CALL_RESULT=$(echo $CURL_RESULT | jq '.success')

if [ "$CALL_RESULT" = "false" ]; then
    echo -ne "Wrong or expired credentials."
    rm ~/.local/share/hyprland-de/token
    exit 1
fi

CALL_RESULT=$(echo $CURL_RESULT | jq '.message')

mkdir -p ~/.local/share/hyprland-de/
echo -ne "#!/bin/sh\n# Do not share this token with anyone.\nHLA_TOKEN=$CALL_RESULT\nHLA_LAST_REFRESH=$(date +%s)\n" > ~/.local/share/hyprland-de/token