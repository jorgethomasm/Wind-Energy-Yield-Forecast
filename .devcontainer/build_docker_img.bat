wsl docker build -t wind-power-forecast:prod .. -f Dockerfile --progress=plain --build-arg PROJECT_NAME="Wind Power Forecast" --build-arg VENV_NAME="venv" --build-arg R_VERSION_MAJOR=4 --build-arg R_VERSION_MINOR=3 --build-arg R_VERSION_PATCH=1 --build-arg DEBIAN_FRONTEND=noninteractive --build-arg CRAN_MIRROR="https://cran.rstudio.com/" --build-arg QUARTO_VER=$QUARTO_VER