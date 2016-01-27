#!/bin/bash -e

if [ $# -eq 0 ]; then
   echo "Must have API key to run example"
   exit 1
fi
categories_url_data="http://www.onlocationvacations.com/2015/03/05/the-new-ghostbusters-movie-begins-filming-in-boston-in-june/"

curl "https://api.rosette.com/rest/v1/categories" \
  -H "user_key: $1"\
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"contentUri\": \"$categories_url_data\"}"
