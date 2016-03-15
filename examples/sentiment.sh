#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "usage: $0 api_key [alternate_url]"
    exit 1
fi
sentiment_text_data="Original Ghostbuster Dan Aykroyd, who also co-wrote the 1984 Ghostbusters film, couldn’t be more pleased with the new all-female Ghostbusters cast, telling The Hollywood Reporter, “The Aykroyd family is delighted by this inheritance of the Ghostbusters torch by these most magnificent women in comedy.”"

TMPFILE=`mktemp` || exit 1
echo ${sentiment_text_data} >> ${TMPFILE}

if [ -z "$2" ]; then
    url="https://api.rosette.com/rest/v1/sentiment"
else
    url="$2/sentiment"
fi

curl \
  -F "content=@${TMPFILE}" \
  -F "request= {\"language\": \"eng\"};type=application/json" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Accept:application/json' \
   "$url" \
