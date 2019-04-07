#!/usr/bin/env bash

n=$1
for (( i=1; i<=n; i++ )); do
  if [ $((n%i)) -eq 0 ]; then
    [ $i == 3 ] && sound+='Pling'
    [ $i == 5 ] && sound+='Plang'
    [ $i == 7 ] && sound+='Plong'
  fi
done

echo "${sound:-$n}"
