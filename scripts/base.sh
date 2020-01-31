#!/usr/bin/env bash

set -e

_BASEPATH=$(dirname $(realpath $0))

_cwd="$PWD"
echo "The current working directory is $_BASEPATH"

_envFile=".env"

if [ ! -f $_envFile ]; then
    echo "$_envFile does not exist, exiting"
    exit
fi

source "${_BASEPATH}/.env"
source "${_BASEPATH}/scripts/config/default.sh"

function _info  {
    echo -e "\e[34m\e[1m\e[4m ${1}\e[0m"
}