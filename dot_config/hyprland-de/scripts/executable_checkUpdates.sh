#!/bin/bash

$(dirname "$0")/refresh.sh

. ~/.local/share/hyprland-de/token

curl -s -X GET -H "Cookie: hla-token=$HLA_TOKEN;" -d "{\"channel\": \"$HLA_CHANNEL\", \"version\": \"$HLA_VERSION\"}" https://account.hypr.land/api/v1/de_update