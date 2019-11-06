#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "usage: $0 api_key [alternate_url]"
  exit 1
fi
transliteration_data="ana r2ye7 el gam3a el sa3a 3 el 3asr"

if [ -z "$2" ]; then
  url="https://api.rosette.com/rest/v1/transliteration"
else
  url="$2/transliteration"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$transliteration_data\"}"
