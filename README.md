# Tool for download and visualize all your reposts on soundcloud

> !! IMPORTANT NOTE !!
> I am not responsible for the way and motivations how that script will be used by potential users.
> I don't encourage users to download this data

1. Log In into your soundcloud account.
2. Open chrome devtools with 'Network' tab.
3. Go to https://soundcloud.com/{yourUserName}
4. In devtools select "xhr" and search for title of your latest reposted track. 
You should find request URL like: https://api-v2.soundcloud.com/me/playlist_reposts/ids?limit=200&client_id={someId}&app_version={version}&app_locale=pl
When you find that - copy it and replace url variable in `scrap.sh`.
Also copy the request header "Authorization: Oauth something" and replace auth variable.
5. Run commands in cli
```
chmod +x scrap.sh
./scrap.sh
```
6. Wait when all your data will be downloaded and press ctrl+C. Delete empty files.
7. Run commands in cli
```
cd chunks-all

# merge
 jq -n '{ list: [ inputs ] | add }' *.json > merged.json

# count
 cat merged.json | jq -r ".list" | jq length 

# sort by timestamp
 jq '.list |= sort_by(.created_at)' merged.json > sorted.json

cp sorted.json ../sc-dataset-visualizer/src/assets/dataset

```

8. Go to ../sc-dataset-visualizer:
```
npm install

# run app
npm run serve
```

9. Go to localhost:8080 and see your data.
