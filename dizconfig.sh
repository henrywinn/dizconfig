#!/bin/sh

help() {
    echo "dizconfig - A script to help me (henrywinn@henrywinn.com) configure my server to do stuff I want it to do"
    echo ""
    echo "    jazz init                  - include jasmine in the project";
    echo "    jazz create FunctionName   - creates ./src/FunctionName.js ./spec/FunctionNameSpec.js";
    echo "    jazz run                   - runs tests in browser";
}

install_zsh() {
    sudo apt-get update
    sudo apt-get install zsh
    sudo chsh -s $(which zsh)
}

ALGO_URL="https://github.com/trailofbits/algo/archive/master.zip"

install_algo() {
    wget $ALGO_URL -P /tmp/algo
    unzip /tmp/algo/algo-master -d ~/algo
    
    sudo apt-get update && sudo apt-get install \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev \
    python-pip \
    python-setuptools \
    python-virtualenv -y

    python -m virtualenv --python=`which python2` env &&
    source env/bin/activate &&
    python -m pip install -U pip virtualenv &&
    python -m pip install -r requirements.txt
}

case "$1" in
    install_zsh)
        install_zsh
    ;;
    install_algo)
        install_algo
    ;;
    *)
        help
    ;;
esac