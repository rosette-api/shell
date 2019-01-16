#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "usage: $0 api_key [alternate_url]"
    exit 1
fi
data="spy"
opts="{\"resultLanguages\": [\"spa\", \"deu\", \"jpn\"]}"

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/semantics/similar"
else
    url="$2/semantics/similar"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$data\", \"options\": $opts}"
