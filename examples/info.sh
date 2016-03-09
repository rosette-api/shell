#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "usage: $0 api_key [alternate_url]"
    exit 1
fi

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/info"
else
    url="$2/info"
fi

curl "$url" -H "X-RosetteAPI-Key: $1"
