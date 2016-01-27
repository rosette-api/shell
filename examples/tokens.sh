#!/bin/bash -e

if [ $# -eq 0 ]; then
   echo "Must have API key to run example"
   exit 1
fi
tokens_data="北京大学生物系主任办公室内部会议"

curl "https://api.rosette.com/rest/v1/tokens" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$tokens_data\"}"
