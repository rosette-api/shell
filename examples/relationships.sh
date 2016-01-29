#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "usage: $0 api_key [alternate_url]"
    exit 1
fi
relationships_text_data="Bill Murray is in the new Ghostbusters film!"

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/relationships"
else
    url="$2/relationships"
fi

curl "$url" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$relationships_text_data\", \"options\": {\"model\": \"short-string\", \"explain\": true}}"
