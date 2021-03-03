#!/bin/bash
x=1;

# change it
url="https://api-v2.soundcloud.com/stream/users/155366472?client_id=YOURCLIENTID&limit=20&offset=0............"

is_found=false
is_first_run=false

# for creating new directory :)
let last_count=$(ls -d ./chunks-all/*/ | wc -l)
echo "last_count=$last_count"
if [ "$last_count" == "0" ]; then
    is_first_run=true
fi

let count=$last_count+1
echo "count=$count"

mkdir -p chunks-all/${count}

while [ "$is_found" == "false" ] ; do
    
    # get data
    curl -X GET -H 'Authorization: OAuth UR TOKEN' -H 'Content-Type: application/json' $url > tmp.json
    
    # url to extract new data chunk
    url=$(cat tmp.json | jq -r ".next_href")
    # echo $url;

    # get all reposted tracks from chunk
    cat tmp.json | jq -r ".collection" > ./chunks-all/${count}/$x.json
    
    # every chunk has incremental names
    x=`expr $x + 1`
    echo $x;

    if [ "$is_first_run" == "false" ]; then
        # we need to fetch the diff between your last fetch if you dowloaded that data before. 
        # for updates
        last_uuid=$(cat ./chunks-all/${last_count}/1.json | jq '.[0].uuid')

        # determine that previous chunk is found, if is never found - then dowload all data
        is_found=$(cat tmp.json | jq -e "any( .collection[] ; .uuid == ${last_uuid} )")
        
        echo "last_uuid=${last_uuid}"
        echo "is_found=$is_found"
    fi
    # interval to dont overload the api, love you soundcloud devs :)
    sleep 5s;
done
echo "ok"

# clean trash
# rm tmp.json