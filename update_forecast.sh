#!/usr/bin/env bash
source /opt/renv/bin/activate 

quarto render ./Wind-Energy-Yield-Forecast.qmd --to html

echo "Finish"
p=$(pwd)
git config --global --add safe.directory $p

if [[ "$(git status --porcelain)" != "" ]]; then
    #quarto render R/index.qmd
    git config --global user.name $USER_NAME
    git config --global user.email $USER_EMAIL
    #git add csv/*
    #git add metadata/*
    git add docs/*
    git commit -m "Auto update of the forecast"
    git push origin main
else
echo "Nothing to commit..."
fi