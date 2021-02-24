cd chunks-all

# merge
 jq -n '{ list: [ inputs ] | add }' *.json > merged.json

#count
 cat merged.json | jq -r ".list" | jq length 

# sort by timestamp
 jq '.list |= sort_by(.created_at)' merged.json > sorted.json

cp sorted.json ../sc-dataset-visualizer/src/assets/dataset
