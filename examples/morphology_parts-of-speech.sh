#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "usage: $0 api_key [alternate_url]"
    exit 1
fi
morphology_parts_of_speech_data="The fact is that the geese just went back to get a rest and I"\'"m not banking on their return soon"

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/morphology/parts-of-speech"
else
    url="$2/morphology/parts-of-speech"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$morphology_parts_of_speech_data\"}"
