#!/bin/bash

set -e

_BASEPATH=$(dirname $(realpath $0))
source "${_BASEPATH}/scripts/base.sh"

for V in "${IMAGES[@]}";
  do
    echo $V
    _imagePath=${IMAGE_PATHS[$V]}
    cd ${_cwd}/${_imagePath};

    echo "$PWD"

    for tag in {$_VERSION,latest}; do
      echo "$HUB:$V:$tag"
      docker push "$HUB/$V:$tag"
    done

    echo ""
done