#!/usr/bin/env -S awk -f
NF==2 && $2 ~ /^[0-9]/ { prefix = $1" "$2 } 
  $1 ~ /^[0-9]/ { print prefix": "$0 }

