#!/bin/bash -e

if [ $# -eq 0 ]; then
   echo "Must have API key to run example"
   exit 1
fi
translated_name_data="معمر محمد أبو منيار القذاف"

curl "https://api.rosette.com/rest/v1/translated-name" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"name\": \"$translated_name_data\" \"targetLanguage\": \"eng\"}"
