#!/usr/bin/env bash
source /opt/venv/bin/activate 

rm -rf .R/docs/
quarto render ./R/Wind-Energy-Yield-Forecast.qmd --to html

rm -rf ./docs
cp -R ./R/docs/. ./docs/

echo "Finish"
p=$(pwd)
git config --global --add safe.directory $p

if [[ "$(git status --porcelain)" != "" ]]; then
    quarto render R/docs/index.qmd
    git config --global user.name $USER_NAME
    git config --global user.email $USER_EMAIL    
    git add data/*
    git add docs/*
    git commit -m "Forecast updated"
    git push origin main
else
echo "Nothing to commit..."
fi