#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "usage: $0 api_key [alternate_url]"
  exit 1
fi
categories_url_data="https://onlocationvacations.com/2018/02/06/downton-abbey-exhibition-extended-april-2-nyc/"

if [ -z "$2" ]; then
  url="https://api.rosette.com/rest/v1/categories"
else
  url="$2/categories"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1"\
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"contentUri\": \"$categories_url_data\"}"
