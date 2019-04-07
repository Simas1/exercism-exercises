#!/usr/bin/env bash

set -o errexit # (a.k.a. set -e) make your script exit when a command fails
# Then add || true to commands that you allow to fail

set -o nounset # (a.k.a. set -u) exit when your script tries to use undeclared variables
# Use :- if you want to test variables that could be undeclared.
# For instance: if [ "${NAME:-}" = "Kevin" ] will set $NAME to be empty if it's not declared.

#set -o xtrace # (a.k.a set -x) to trace what gets executed. Useful for debugging

local script_dir="$(dirname "${BASH_SOURCE[0]}")"
local script_file="$(basename "${BASH_SOURCE[0]}")"

function error_exit() {
  # printf "ERROR inside $script_file. Exception: %s\n" $1 >&2
  echo "ERROR inside $script_file. Exception: $1" >&2
  exit 1
}

# { # try
#     command1 &&
#     #save your output
# } || { # catch
#     # save log for exception
# }

echo "${BASH_SOURCE[0]}"
