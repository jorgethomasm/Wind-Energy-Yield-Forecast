#!/usr/bin/env bash

echo "Installing Quarto version 1.5.54"

if [[ $(uname -m) ==  "aarch64" ]] ; then
  CPU="arm64"
elif [[ $(uname -m) ==  "arm64" ]] ; then
  CPU="arm64"
else
  CPU="amd64"
fi

TEMP_QUARTO="$(mktemp)" && \
    # wget  -O "$TEMP_QUARTO" https://github.com/quarto-dev/quarto-cli/releases/download/v$QUARTO_VERSION/quarto-$QUARTO_VERSION-linux-$CPU.deb && \    
    wget  -O "$TEMP_QUARTO" https://github.com/quarto-dev/quarto-cli/releases/download/v1.5.54/quarto-1.5.54-linux-amd64.deb && \    
    sudo dpkg -i "$TEMP_QUARTO" && \
    rm -f "$TEMP_QUARTO"
    