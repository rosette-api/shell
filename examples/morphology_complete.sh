#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "usage: $0 api_key [alternate_url]"
    exit 1
fi
morphology_complete_data="The quick brown fox jumped over the lazy dog. Yes he did."

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/morphology/complete"
else
    url="$2/morphology/complete"
fi

curl "$url" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$morphology_complete_data\"}"
