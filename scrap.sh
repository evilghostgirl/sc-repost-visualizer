#!/bin/bash
x=1;

url="https://api-v2.soundcloud.com/stream/users/somelink"
auth='Authorization: OAuth token'
mkdir chunks-all
while [ true ] ; do
    curl -X GET -H $auth -H 'Content-Type: application/json' $url > tmp.json
    url=$(cat tmp.json | jq -r ".next_href")
    echo $url;
    cat tmp.json | jq -r ".collection" > ./chunks-all/$x.json
    x=`expr $x + 1`
    echo $x;
    sleep 2s;
done