#!/bin/bash

WORKDIR=/opt/chrome
CURRENTDIR=$(pwd)

# Fetching depot_tools
if [ ! -d "depot_tools" ]; then
    sudo docker run --rm -u="$(id -u)" -w="$WORKDIR" -v $CURRENTDIR:$WORKDIR --name docker-chromium docker-chromium git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
fi

# Fetching Chrome source
if [ ! -d "chromium" ]; then
    mkdir chromium && cd chromium
    echo "Fetching sources"
    sudo docker run --rm -u="$(id -u)" -w="$WORKDIR" -v $CURRENTDIR:$WORKDIR --name docker-chromium docker-chromium fetch --nohooks android
fi
