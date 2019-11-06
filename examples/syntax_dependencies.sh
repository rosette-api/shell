#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "usage: $0 api_key [alternate_url]"
  exit 1
fi
syntax_dependencies_data="Yoshinori Ohsumi, a Japanese cell biologist, was awarded the Nobel Prize in Physiology or Medicine on Monday."

if [ -z "$2" ]; then
  url="https://api.rosette.com/rest/v1/syntax/dependencies"
else
  url="$2/syntax/dependencies"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$syntax_dependencies_data\"}"
