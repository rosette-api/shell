#!/bin/bash -e

if [ $# -eq 0 ]; then
    echo "Must have API key to run example"
    exit 1
fi
entities_text_data="Bill Murray will appear in new Ghostbusters film: Dr. Peter Venkman was spotted filming a cameo in Boston this… http://dlvr.it/BnsFfS"

curl "https://api.rosette.com/rest/v1/entities" \
  -H "user_key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$entities_text_data\"}"
