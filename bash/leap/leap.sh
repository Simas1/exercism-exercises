#!/usr/bin/env bash

year=$*
if ! [[ "$year" =~ ^[0-9]+$ ]]; then
  echo 'Usage: leap.sh <year>'
  exit 1
fi

if [ $((year % 4)) -eq 0 ] && { [ $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]; }; then
  echo 'true'
else
  echo 'false'
fi
