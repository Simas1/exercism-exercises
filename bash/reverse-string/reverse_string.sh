#!/usr/bin/env bash

input=$1

lenght=$((${#input}-1))

reverse=""
for ((i=lenght; i>=0; i--)); do
    reverse+="${input:$i:1}"
done

echo "$reverse"
