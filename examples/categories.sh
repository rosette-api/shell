#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "usage: $0 api_key [alternate_url]"
  exit 1
fi
categories_text_data="If you are a fan of the British television series Downton Abbey and you are planning to be in New York anytime before April 2nd, there is a perfect stop for you while in town."

if [ -z "$2" ]; then
  url="https://api.rosette.com/rest/v1/categories"
else
  url="$2/categories"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1"\
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$categories_text_data\"}"
