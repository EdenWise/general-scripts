#!/usr/bin/bash
# (v)im (s)cratchpad — create a scratchpad/temporary file

tme_day=$(date +%m%d%H%M)
tmp_dir=~/.local/share/Trash/files/ ; [ -d "$tmp_dir" ] || tmp_dir=/tmp

# program existence test
hash vim 2>&- || { echo program required: vim ; exit 1 ; }

# help
if [[ "$*" =~ (^| )-h( |$) ]] || [[ "$*" =~ (^| )--help( |$) ]] ; then
  echo "${0##*/} <name1*> — create a scratchpad/temporary file"
  exit 2
fi

if [ "$1" ]; then
  vim "$tmp_dir"/"$tme_day"-"$1"
else
  vim "$tmp_dir"/"$tme_day"
fi
