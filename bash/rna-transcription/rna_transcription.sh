#!/usr/bin/env bash

dna=$1
rna=''
for ((i=0; i<${#dna}; i++)); do
  case ${dna:$i:1} in
  [Gg]) rna+='C' ;;
  [Cc]) rna+='G' ;;
  [Tt]) rna+='A' ;;
  [Aa]) rna+='U' ;;
  *)
    echo 'Invalid nucleotide detected.'
    exit 1
    ;;
  esac
done
echo "$rna"

# with external command - tr
# [[ $1 =~ [^GCTA] ]] && { echo 'Invalid nucleotide detected.'; exit 1; }
# echo $1 | tr '[GCTA]' '[CGAU]'

# with associative array
# declare -A dict=( ['G']='C' ['C']='G' ['T']='A' ['A']='U' ) # only bash 4.*
# ${dict['T']}
