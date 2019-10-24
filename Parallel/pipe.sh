#!/usr/bin/env bash
echo -e "cat num1000000 | parallel --pipe wc\n"
cat num1000000 | parallel --pipe wc
echo
echo -e "cat num1000000 | parallel --pipe --block 2M wc\n"
cat num1000000 | parallel --pipe --block 2M wc
echo
echo -e "cat num1000000 | parallel --pipe -j4 --round-robin wc\n"
cat num1000000 | parallel --pipe -j4 --round-robin wc
echo
echo -e "cat num1000000 | parallel --pipe -j4 --keep-order --round-robin wc\n"
cat num1000000 | parallel --pipe -j4 --keep-order --round-robin wc
echo
exit 0
