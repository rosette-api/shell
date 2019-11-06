#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "usage: $0 api_key [alternate_url]"
  exit 1
fi
tokens_data="北京大学生物系主任办公室内部会议"

if [ -z "$2" ]; then
  url="https://api.rosette.com/rest/v1/tokens"
else
  url="$2/tokens"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$tokens_data\"}"
