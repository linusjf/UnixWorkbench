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
echo ${foss/Fedora/Ubuntu}
echo ${foss/free/popular}
fact="Sun is a big star"
echo ${fact/big}
cell="112-358-1321"
echo ${cell/-}
echo ${cell//-}
echo $cell
cell=${cell//-}
echo $cell
legend="john nash"
actor="JULIA ROBERTS"
echo ${legend^^}
echo ${actor,,}
echo ${legend^}
echo ${actor,}
echo ${legend^^[jn]}
echo ${legend^^[oa]}
