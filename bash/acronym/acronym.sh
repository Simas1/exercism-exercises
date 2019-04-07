#!/usr/bin/env bash

input=${1//[-]/' '}
for word in $input; do
  acr+=${word:0:1}
done
echo "$acr" | tr "[:lower:]" "[:upper:]"
