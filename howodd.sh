#! /usr/bin/env bash
# File: howodd.sh
source nevens.sh
function howodd {
evens=$(nEvens $*)
let odds=$#-$evens
let percent=$odds*100
let percent=$percent/$#
echo $percent%
}

