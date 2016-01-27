#!/bin/bash -e

if [ $# -eq 0 ]; then
   echo "Must have API key to run example"
   exit 1
fi
morphology_parts_of_speech_data="The fact is that the geese just went back to get a rest and I"'"'"m not banking on their return soon"

curl "https://api.rosette.com/rest/v1/morphology/parts-of-speech" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$morphology_parts_of_speech_data\"}"
