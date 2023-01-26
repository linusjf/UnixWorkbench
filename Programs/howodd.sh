#!/usr/bin/env bash
# File: howodd.sh
#shellcheck disable=SC1091
source nevens.sh
function howodd() {
  evens=$(nEvens "$@")
  odds=$(($# - evens))
  percent=$((odds * 100))
  percent=$((percent / $#))
  echo $percent%
}
