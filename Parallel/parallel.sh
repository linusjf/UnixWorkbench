#!/usr/bin/env bash
seq 5 | parallel seq {} '>' example.{}
parallel echo ::: 1 2 3 4 5
parallel wc ::: example.*
parallel echo ::: S M L ::: Green Red
find example.* -print | parallel echo File
parallel wc -l ::: example.*
parallel echo counting lines';' wc -l ::: example.*
parallel echo counting {}';' wc -l {} ::: example.*
parallel echo count {1} in {2}';' wc {1} {2} ::: -l -c ::: example.*
parallel --dry-run echo count {1} in {2}';' wc {1} {2} ::: -l -c \
 ::: example.*
