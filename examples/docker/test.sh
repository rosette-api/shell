#!/bin/bash

test1="\\["
test2="\\[[{\""
#sample="This is a [{\"foo\": \"bar\"}] test of []"
sample="This is a test of []"
sample='{"requestId":"77069275-a959-4894-867c-f982d36f7eee","posTags":[{"text":"The","pos":"DET"},{"text":"quick","pos":"ADJ"},{"text":"brown","pos":"ADJ"},{"text":"fox","pos":"NOUN"},{"text":"jumped","pos":"PARTPAST"},{"text":"over","pos":"PREP"},{"text":"the","pos":"DET"},{"text":"lazy","pos":"ADJ"},{"text":"dog","pos":"NOUN"},{"text":".","pos":"SENT"},{"text":"Yes","pos":"VI"},{"text":"he","pos":"PRONPERS"},{"text":"did","pos":"VDPAST"},{"text":".","pos":"SENT"}],"lemmas":[{"text":"The","lemma":"the"},{"text":"quick","lemma":"quick"},{"text":"brown","lemma":"brown"},{"text":"fox","lemma":"fox"},{"text":"jumped","lemma":"jump"},{"text":"over","lemma":"over"},{"text":"the","lemma":"the"},{"text":"lazy","lemma":"lazy"},{"text":"dog","lemma":"dog"},{"text":".","lemma":"."},{"text":"Yes","lemma":"yes"},{"text":"he","lemma":"he"},{"text":"did","lemma":"do"},{"text":".","lemma":"."}],"compounds":[],"hanReadings":[]}'
#sample='{"requestId":"06d27ebb-a1dc-42a8-a55d-ddd3aebec5e0","relationships":[]}'
#sample='{"name":"Rosette API","version":"0.8.0","buildNumber":"","buildTime":""}'
sample='{"requestId":"af0046e4-53c0-461c-a538-5a9492896ef3","sentences":["This land is your land. ","This land is my land\nFrom California to the New York island;\nFrom the red wood forest to the Gulf Stream waters\n\nThis land was made for you and Me.\n\n","As I was walking that ribbon of highway,\nI saw above me that endless skyway:\nI saw below me that golden valley:\nThis land was made for you and me."]}'



echo $test
echo $sample

result=`../morphology_complete.sh 6546eb32aff51822a04e1a604c1c2144 | jq 'del(.requestId) | .[] | length' |  awk '{SUM += $1} END { print SUM }'`

echo $result

