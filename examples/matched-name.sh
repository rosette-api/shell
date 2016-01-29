#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "usage: $0 api_key [alternate_url]"
    exit 1
fi
matched_name_data1="Michael Jackson"
matched_name_data2="迈克尔·杰克逊"

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/matched-name"
else
    url="$2/matched-name"
fi

curl "$url" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"name1\": {\"text\": \"$matched_name_data1\"}, \"name2\": {\"text\": \"$matched_name_data2\"} }"
