#!/usr/bin/env bash

quarto render ./Wind-Energy-Yield-Forecast.qmd --to html

p=$(pwd)
git config --global --add safe.directory $p

if [[ "$(git status --porcelain)" != "" ]]; then
    # quarto render ./docs/index.qmd
    git config --global user.name $USER_NAME
    git config --global user.email $USER_EMAIL    
    git add data/*
    git add docs/*
    git commit -m "Forecast updated"
    git push origin main
else
echo "Nothing to commit..."
fi