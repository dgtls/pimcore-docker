#!/usr/bin/env bash

declare IMAGES=(
  php72apachedebug
  pimcorephp72apachedebug
  php73apachedebug
  pimcorephp73apachedebug
  php74apachedebug
  pimcorephp74apachedebug
)

declare -A IMAGE_PATHS=(
  [php72apachedebug]=PHP72-apache-debug
  [pimcorephp72apachedebug]=Pimcore-PHP72-apache-debug
  [php73apachedebug]=PHP73-apache-debug
  [pimcorephp73apachedebug]=Pimcore-PHP73-apache-debug
  [php74apachedebug]=PHP74-apache-debug
  [pimcorephp74apachedebug]=Pimcore-PHP74-apache-debug
)