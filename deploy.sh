jekyll build
git add -f _site
NOW=$(date +"%m-%d-%Y")
git commit -m "deploy $NOW"
git push