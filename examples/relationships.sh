#!/bin/bash -e

if [ $# -eq 0 ]; then
   echo "Must have API key to run example"
   exit 1
fi
relationships_text_data="Bill Murray is in the new Ghostbusters film!"

curl "https://api.rosette.com/rest/v1/relationships" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$relationships_text_data\", \"options\": {\"model\": \"short-string\", \"explain\": true}}"
