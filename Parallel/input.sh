#!/usr/bin/env bash
parallel echo ::: A B C
parallel -a abc-file echo
cat abc-file | parallel echo
mkfifo myfifo
cat abc-file > myfifo &
parallel -a myfifo echo
rm myfifo
parallel echo :::: <(cat abc-file)
