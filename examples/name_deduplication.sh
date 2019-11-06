#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "usage: $0 api_key [alternate_url]"
  exit 1
fi

names_data='[{"text": "Alice Terry"},{"text": "Alice Thierry"},{"text": "Betty Grable"},{"text": "Betty Gable"},{"text": "Norma Shearer"},{"text": "Norm Shearer"},{"text": "Brigitte Helm"},{"text": "Bridget Helem"},{"text": "Judy Holliday"},{"text": "Julie Halliday"}]'

if [ -z "$2" ]; then
  url="https://api.rosette.com/rest/v1/name-deduplication"
else
  url="$2/name-deduplication"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"names\": $names_data, \"threshold\": 0.75}"
