#!/usr/bin/env bash
# File strings.sh
first='Hello, '
second='World!'
echo "$first"
echo "$second"
echo "$first" "$second"
distro="Ubuntu"
echo "${#distro}"
str1="hand"
str2="book"
str3="$str1""$str2"
echo "$str3"
str="Bash is Cool"
word="Cool"
echo "$(expr index "$str" "$word")"
foss="Fedora is a free operating system"
echo "${foss:0:6}"
echo "${foss:12}"
