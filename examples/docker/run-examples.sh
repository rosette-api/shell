#!/bin/bash

function usage {
    echo "usage: $0 -a api_key [-f example_file.sh] [-u alternate_url]"
    echo "  api_key       - Rosette API key (required)"
    echo "  source_file   - bash example file (optional single file)"
    echo "  alternate_url - Alternate service URL (optional)"
    echo "Runs the example file(s)"
    exit 1
}

filename="na"
alt_url="na"
ping_url="https://api.rosette.com/rest/v1"

while getopts ":a:f:u:" opt; do
    case $opt in
        a)
            api_key=$OPTARG
            ;;
        f)
            filename=$OPTARG
            ;;
        u)
            alt_url=$OPTARG
            ;;
    esac
done

if [ -z $api_key ]; then
    usage
fi

# strip the trailing slash off of the alt_url if necessary
if [ "$alt_url" != "na" ]; then
    case $alt_url in
        */) alt_url=${alt_url::-1}
            echo "Slash detected"
            ;;
    esac
    ping_url=${alt_url}
fi

#Checks for valid url
match=$(curl "${ping_url}/ping" -H "X-RosetteAPI-Key: ${API_KEY}" |  grep -o "Rosette API")
if [ "${match}" = "" ]; then
    echo -e "\n${ping_url} server not responding\n"
    exit 1
fi  

#Checks if Rosette API key is valid
match=$(curl "${ping_url}/ping" -H "X-RosetteAPI-Key: ${API_KEY}" |  grep -o "forbidden")
if [ ! -z ${match} ]; then
    echo -e "\nInvalid Rosette API Key\n"
    exit 1
fi  

badRequest="badRequest"

if [ "$filename" != "na" ]; then
    # single file operation
    if [ "$alt_url" != "na" ]; then
        result=$(../source/$filename $api_key $alt_url)
    else
        result=$(../source/$filename $api_key)
    fi
    echo $result
    # Check for bad request and fail the script if matched
    if [[ ${result} =~ .*$badRequest.* ]]; then
        echo -e "\nUnexpected response\n"
        exit 1
    fi
    responseCount=`echo $result | jq 'del(.requestId) | .[] | length' |  awk '{SUM += $1} END { print SUM }'`
    if [ $responseCount -eq 0 2>/dev/null]; then
        echo -e "\nEmpty response\n"
        exit 1
    fi
else
    # all files with .sh 
    chmod 0755 ../source/*.sh
    for file in ../source/*.sh; do
        echo -e "\n---------- $file start -------------"
        if [ "$alt_url" != "na"  ]; then
            result=$($file $api_key $alt_url)
        else
            result=$($file $api_key)
        fi
        echo $result
        # Check for bad request and fail the script if matched
        if [[ ${result} =~ .*$badRequest.* ]]; then
            echo -e "\nUnexpected response\n"
            exit 1
        fi
        responseCount=`echo $result | jq 'del(.requestId) | .[] | length' |  awk '{SUM += $1} END { print SUM }'`
        if [ $responseCount -eq 0 2>/dev/null ]; then
            echo -e "\nEmpty response\n"
            exit 1
        fi
        echo -e "\n---------- $file end -------------"
    done
fi

echo $alt_url
