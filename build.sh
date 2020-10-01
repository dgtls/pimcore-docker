#!/bin/bash

set -e

_BASEPATH=$(dirname $(realpath $0))
source "${_BASEPATH}/scripts/base.sh"

for V in "${IMAGES[@]}";
  do
    echo $V
    _imagePath=${IMAGE_PATHS[$V]}
    cd ${_BASEPATH}/${_imagePath};

    echo "$PWD"

    for tag in {$VERSION,latest}; do
      echo "$HUB:$V:$tag"
      docker build --pull -t "$HUB/$V:$tag" .
    done

    echo ""
done