#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "usage: $0 api_key [alternate_url]"
  exit 1
fi
morphology_compound_components_data="Rechtsschutzversicherungsgesellschaften"

if [ -z "$2" ]; then
  url="https://api.rosette.com/rest/v1/morphology/compound-components"
else
  url="$2/morphology/compound-components"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$morphology_compound_components_data\"}"
