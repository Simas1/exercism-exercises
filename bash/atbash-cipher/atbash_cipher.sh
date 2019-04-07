#!/usr/bin/env bash

input=${2//[[:blank:]]/}
input=$(echo $input | tr "[:upper:]" "[:lower:]")

if [[ $1 == 'decode' ]]; then
  chiper='abcdefghijklmnopqrstuvwxyz0123456789'
  plain='zyxwvutsrqponmlkjihgfedcba0123456789'
else
  plain='abcdefghijklmnopqrstuvwxyz0123456789'
  chiper='zyxwvutsrqponmlkjihgfedcba0123456789'
fi

function chiper() {
  local find="${plain%%$1*}"
  if [[ $find == $plain ]]; then
    echo '' # skip other chars
  else
    local index=${#find}
    echo ${chiper:$index:1}
  fi
}

res=''
for ((i=0; i<${#input}; i++)); do
  [[ $1 == 'encode' ]] && [[ $((${#res}%6)) -eq 0 ]] && res+=' '
  char="${input:$i:1}"

  res+=$(chiper $char)
done

echo $res
