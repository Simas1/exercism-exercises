#!/usr/bin/env bash

input=$*
input=${input//[[:blank:]]/}

if ! [[ "$input" =~ ^[0-9]{2,}$ ]]; then
 echo 'false'
 exit 0
fi

num=${input// /}
declare -a arr=()
for ((i=0; i<${#num}; i++)); do
  if [ $(((i+1)%2)) -ne 0 ]; then
    # echo ${num:$i:1}
    dup=$((${num:$i:1}*2))
    [ $dup -gt 9 ] && dup=$((dup-9))
    arr+=($dup)
  else
    arr+=(${num:$i:1})
  fi
done

sum=0
for n in ${arr[@]}; do
  sum=$((sum+n))
done

echo $sum
if [ $((sum%10)) -eq 0 ] && [ $sum -ne 0 ]; then
  echo 'true'
else
  echo 'false'
fi


# #!/usr/bin/env bash
# num=$(echo $1 | tr -d " " | sed -e 's/0//')
# [[ $num =~ ^[0-9\s]+$ ]] || { echo false ; exit 0; }
# ! [ ${#num} -lt 2 ] || { echo false ; exit 0 ; }

# counter=0
# total=0
# for x in $(echo $num | grep -o .); do
#     ((x * 2 >= 10)) && y=$((x * 2 - 9)) || y=$((x * 2))
#     ((counter % 2 == 0)) && ((total += $y)) || ((total += $x))
#     ((counter++))
# done

# ((total % 10 == 0)) && echo true || echo false
