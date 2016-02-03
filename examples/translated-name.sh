#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "usage: $0 api_key [alternate_url]"
    exit 1
fi
translated_name_data="معمر محمد أبو منيار القذاف"

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/translated-name"
else
    url="$2/translated-name"
fi

curl "$url" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"name\": \"$translated_name_data\", \"targetLanguage\": \"eng\"}"
