#!/usr/bin/env bash
printf "seq 5 | parallel seq {} '>' example.{}\n"
seq 5 | parallel seq {} '>' example.{}
echo
printf "parallel echo ::: 1 2 3 4 5\n"
parallel echo ::: 1 2 3 4 5
echo
printf "parallel wc ::: example.*\n"
parallel wc ::: example.*
echo
printf "parallel echo ::: S M L ::: Green Red\n"
parallel echo ::: S M L ::: Green Red
echo
printf "find example.* -print | parallel echo File\n"
find example.* -print | parallel echo File
echo
printf "parallel wc -l ::: example.*\n"
parallel wc -l ::: example.*
echo
printf "parallel echo counting lines';' wc -l ::: example.*\n"
parallel echo counting lines';' wc -l ::: example.*
echo
printf "parallel echo counting {}';' wc -l {} ::: example.*\n"
parallel echo counting {}';' wc -l {} ::: example.*
echo
printf "parallel echo count {1} in {2}';' wc {1} {2} ::: -l -c ::: example.*\n"
parallel echo count "{1}" in "{2}"';' wc "{1}" "{2}" ::: -l -c ::: example.*
echo
printf "parallel --dry-run echo count {1} in {2}';' wc {1} {2} ::: -l -c \
  ::: example.*\n"
parallel --dry-run echo count "{1}" in "{2}"';' wc "{1}" "{2}" ::: -l -c \
  ::: example.*
echo
printf "parallel sleep {}';' echo {} \"done\" ::: 5 4 3 2 1\n"
parallel sleep {}';' echo {} "done" ::: 5 4 3 2 1
echo
printf "parallel --keep-order sleep {}';' echo {} \"done\" ::: 5 4 3 2 1\n"
parallel --keep-order sleep {}';' echo {} "done" ::: 5 4 3 2 1
echo
printf "parallel --jobs 2 sleep {}';' echo {} \"done\" ::: 5 4 3 1 2\n"
parallel --jobs 2 sleep {}';' echo {} "done" ::: 5 4 3 1 2
echo
printf "parallel --jobs 5 sleep {}';' echo {} \"done\" ::: 5 4 3 1 2\n"
parallel --jobs 5 sleep {}';' echo {} "done" ::: 5 4 3 1 2
echo
printf "parallel --jobs 0 sleep {}';' echo {} \"done\" ::: 5 4 3 1 2\n"
parallel --jobs 0 sleep {}';' echo {} "done" ::: 5 4 3 1 2
echo
printf "seq 1000000 | parallel --pipe wc\n"
seq 1000000 | parallel --pipe wc
echo
exit 0
