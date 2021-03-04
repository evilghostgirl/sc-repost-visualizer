let last_count=$(ls -d ./chunks-all/*/ | wc -l)
echo "last_count=$last_count"

# hm

# zmergować n-1 plików

# wziąć index ostatniego występującego utworu ze starego chunka
index=$(cat chunks-all/2/3.json | jq  '.[] | .uuid ' | jq -s | jq ' indices("00000177-db29-25f8-ffff-ffff8b45ac59") | .[0]')

# wybrać [0, index]
cat chunks-all/2/3.json| jq ".[0,${index}]" | jq -s > chunks-all/2/3.test.json
# zmergować
# zmergowac z merged.json
# posortowac

cd chunks-all

# merge
 jq -n '{ list: [ inputs ] | add }' *.json > merged.json

# count
 cat merged.json | jq -r ".list" | jq length 

# sort by timestamp
jq '.list |= sort_by(.created_at)' merged.json > sorted.json

cp sorted.json ../sc-dataset-visualizer/src/assets/dataset
