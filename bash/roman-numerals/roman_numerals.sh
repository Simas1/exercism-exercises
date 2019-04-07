#!/usr/bin/env bash

function decode() {
  local input=$1
  function rom_num() {
    case $1 in
      I|i) echo 1 ;;
      V|v) echo 5 ;;
      X|x) echo 10 ;;
      L|l) echo 50 ;;
      C|c) echo 100 ;;
      D|d) echo 500 ;;
      M|m) echo 1000 ;;
      *) echo '' # skip other symbols
    esac
  }

  local -i pre=10000
  local -i sum=0
  local -i int
  for ((i=0; i<${#input}; i++)); do
    int=$(rom_num "${input:$i:1}")
    [[ $int -eq 0 ]] && continue # skip other symbols
    if [[ $int -le $pre ]]; then
      sum+=$int
    else
      sum=$((sum-pre+int-pre))
    fi
    pre=$int
  done

  echo $sum
}

function encode() {
  local -i input=$1
  local res=''
  while [[ $input -gt 0 ]]; do
    if [[ $input -ge 1000 ]]; then
      res+='M'
      input=$input-1000
    elif [[ $input -ge 900 ]]; then
      res+='CM'
      input=$input-900
    elif [[ $input -ge 500 ]]; then
      res+='D'
      input=$input-500
    elif [[ $input -ge 400 ]]; then
      res+='CD'
      input=$input-400
    elif [[ $input -ge 100 ]]; then
      res+='C'
      input=$input-100
    elif [[ $input -ge 90 ]]; then
      res+='XC'
      input=$input-90
    elif [[ $input -ge 50 ]]; then
      res+='L'
      input=$input-50
    elif [[ $input -ge 40 ]]; then
      res+='XL'
      input=$input-40
    elif [[ $input -ge 10 ]]; then
      res+='X'
      input=$input-10
    elif [[ $input -ge 9 ]]; then
      res+='IX'
      input=$input-9
    elif [[ $input -ge 5 ]]; then
      res+='V'
      input=$input-5
    elif [[ $input -ge 4 ]]; then
      res+='IV'
      input=$input-4
    elif [[ $input -ge 1 ]]; then
      res+='I'
      input=$input-1
    fi
  done

  echo $res
}

# decode "MCMLXIII"
# encode 1963

encode "$1"

# benchmark: (time)
# time for i in {1..999999}; do echo "$i" >/dev/null; done

# --- nice solution ---
  # #!/usr/bin/env bash
  # set -o errexit
  # set -o nounset

  # PROGNAME=$(basename "$0")

  # error_exit() {
  #   printf 'Usage: %s NUMBER\n' "${PROGNAME}" 1>&2
  #   exit 1
  # }

  # declare -a VALUES=(1000 900 500 400 100 90 50 40 10 9 5 4 1)
  # declare -A NUMERALS=(
  #   [1000]=M [900]=CM [500]=D [400]=CD [100]=C [90]=XC [50]=L [40]=XL [10]=X
  #   [9]=IX [5]=V [4]=IV [1]=I)

  # # calculate the Roman Numeral representation for a given number
  # roman_numerals() {
  #   local number result decimal
  #   number="$1"
  #   result=
  #   for decimal in "${VALUES[@]}"
  #     do
  #       while (( number % decimal < number ))
  #         do
  #           result="${result}${NUMERALS[$decimal]}"
  #     # cannot use -= here as bash will exit on 0 with errexit set
  #     number=$(( number - decimal ))
  #   done
  #     done
  #   printf '%s\n' "${result}"
  # }

  # main() {
  #   # handle wrong number of inputs
  #   if [ "$#" -ne 1 ] || ! [[ "$1" =~ ^[[:digit:]]+$ ]]
  #   then
  #     error_exit
  #   fi
  #   roman_numerals "$1"
  # }

  # main "$@"

