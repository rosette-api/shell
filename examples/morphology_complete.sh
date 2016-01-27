#!/bin/bash -e

if [ $# -eq 0 ]; then
   echo "Must have API key to run example"
   exit 1
fi
morphology_complete_data="The quick brown fox jumped over the lazy dog. Yes he did."

curl "https://api.rosette.com/rest/v1/morphology/complete" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$morphology_complete_data\"}"
