#!/usr/bin/env bash
source /opt/venv/bin/activate 

rm -rf ./R/Wind-Energy-Yield-Forecast
rm ./R/Wind-Energy-Yield-Forecast.html
quarto render ./R/Wind-Energy-Yield-Forecast.qmd --to html

rm -rf docs/Wind-Energy-Yield-Forecast/
mkdir docs/Wind-Energy-Yield-Forecast
cp ./R/Wind-Energy-Yield-Forecast.html ./docs/Wind-Energy-Yield-Forecast/
cp -R ./R/Wind-Energy-Yield-Forecast ./docs/Wind-Energy-Yield-Forecast/

echo "Finish"
p=$(pwd)
git config --global --add safe.directory $p

if [[ "$(git status --porcelain)" != "" ]]; then
    quarto render R/index.qmd
    git config --global user.name $USER_NAME
    git config --global user.email $USER_EMAIL
    git add csv/*
    git add metadata/*
    git add docs/*
    git commit -m "Auto update of the data"
    git push origin main
else
echo "Nothing to commit..."
fi