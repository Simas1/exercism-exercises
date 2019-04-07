#!/usr/bin/env bash

strand1=$1
strand2=$2

if [ $# -ne 2 ]; then
  echo 'Usage: hamming.sh <string1> <string2>'
  exit 1
fi

if [ ${#strand1} -ne ${#strand2} ]; then
  echo 'left and right strands must be of equal length'
  exit 1
fi

dif=0
for ((i=0; i<=$((${#strand1}-1)); i++)); do
  [ "${strand1:$i:1}" != "${strand2:$i:1}" ] && dif=$((dif+1))
done
echo $dif
