#!/bin/bash -e

if [ $# -lt 1 ]; then
echo "usage: $0 api_key [alternate_url]"
    exit 1
fi

entities_linked_text_data="Last month director Paul Feig announced the movie will have an all-star female cast including Kristen Wiig, Melissa McCarthy, Leslie Jones and Kate McKinnon."

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/entities/linked"
else
    url="$2/entities/linked"
fi

curl -s "$url" \
    -H "X-RosetteAPI-Key: $1" \
    -H 'Content-Type:application/json' \
    -H 'Accept:application/json' \
    -d "{\"content\": \"$entities_linked_text_data\"}"
