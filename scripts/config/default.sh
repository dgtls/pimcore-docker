#!/usr/bin/env bash

declare IMAGES=(
  php80apachedebug
  pimcorephp80apachedebug
)

declare -A IMAGE_PATHS=(
  [php80apachedebug]=PHP80-apache-debug
  [pimcorephp80apachedebug]=Pimcore-PHP80-apache-debug
)