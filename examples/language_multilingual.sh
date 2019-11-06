#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "usage: $0 api_key [alternate_url]"
  exit 1
fi
language_multilingual_data='On Thursday, as protesters gathered in Washington D.C., the United States Federal Communications Commission under Chairman Ajit Pai voted 3-2 to overturn a 2015 decision, commonly called Net Neutrality, that forbade Internet service providers (ISPs) such as Verizon, Comcast, and AT&T from blocking individual websites or charging websites or customers more for faster load times.  Quatre femmes ont été nommées au Conseil de rédaction de la loi du Qatar. Jeudi, le décret royal du Qatar a annoncé que 28 nouveaux membres ont été nommés pour le Conseil de la Choura du pays.  ذكرت مصادر أمنية يونانية، أن 9 موقوفين من منظمة \"د هـ ك ب ج\" الذين كانت قد أوقفتهم الشرطة اليونانية في وقت سابق كانوا يخططون لاغتيال الرئيس التركي رجب طيب أردوغان.'

if [ -z "$2" ]; then
  url="https://api.rosette.com/rest/v1/language"
else
  url="$2/language"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"content\": \"$language_multilingual_data\" , \"options\": {\"multilingual\": true}}"
