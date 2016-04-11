#!/usr/bin/bash
# (v)im (t)emporary file — create temporary scratchpad

tmp_dir=~/.local/share/Trash/files
tme_day=$(date +%m%d%H%M)

[ ! -d "$tmp_dir" ] && mkdir -pv "$tmp_dir"

# existence test for program
hash vim 2>&- || { echo "Program required: vim." ; exit 1 ; }

# usage
if [ "$1" = -h -o "$1" = --help ]; then
  echo "${0##*/} [name1] [name2*] — create a temporary scratchpad"
  exit 2
fi

if [ "$1" ]; then
  for name in "$@"; do
    vim "$tmp_dir"/"$tme_day"-"$name"
  done
else
  vim "$tmp_dir"/"$tme_day"
fi
