#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "usage: $0 api_key [alternate_url]"
    exit 1
fi
entities_text_data="Bill Murray will appear in new Ghostbusters film: Dr. Peter Venkman was spotted filming a cameo in Boston this… http://dlvr.it/BnsFfS"

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/entities"
else
    url="$2/entities"
fi

encoded_data=`echo "$entities_text_data" | base64 -w0`

curl "$url" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\":\"$encoded_data\",\"contentType\":\"application/octet-stream\"}"
