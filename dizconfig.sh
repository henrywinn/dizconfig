#!/bin/sh
case "$1" in
    install_zsh)
        install_zsh
    ;;
    *)
        help
    ;;
esac

function help() {
    echo "dizconfig - A script to help me (henrywinn@henrywinn.com) configure my server to do stuff I want it to do"
    echo ""
    echo "    jazz init                  - include jasmine in the project";
    echo "    jazz create FunctionName   - creates ./src/FunctionName.js ./spec/FunctionNameSpec.js";
    echo "    jazz run                   - runs tests in browser";
}

function install_zsh() {
    apt-get update
    apt-get install zsh
    chsh -s $(which zsh)
}