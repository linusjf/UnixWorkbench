#! /usr/bin/env bash
# File: wordcount.sh
tr -cs A-Za-z '\n' | tr A-Z a-z | sort | 
uniq -c | sort -rn | head -${1}
