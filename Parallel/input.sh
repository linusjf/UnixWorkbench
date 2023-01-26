#!/usr/bin/env bash
printf "parallel echo ::: A B C\n"
parallel echo ::: A B C
echo
printf "parallel -a abc-file echo\n"
parallel -a abc-file echo
echo
printf "parallel echo < abc-file\n"
parallel echo <abc-file
echo
printf "mkfifo myfifo\n"
printf "cat abc-file > myfifo &\n"
printf "parallel -a myfifo echo\n"
printf "rm myfifo\n"
mkfifo myfifo
cat abc-file >myfifo &
parallel -a myfifo echo
rm myfifo
echo
printf "parallel echo :::: <(cat abc-file)\n"
parallel echo :::: <(cat abc-file)
echo
printf "parallel echo ::: A B C ::: D E F\n"
parallel echo ::: A B C ::: D E F
echo
printf "parallel -a abc-file -a def-file echo\n"
parallel -a abc-file -a def-file echo
echo
printf "parallel -a - -a def-file echo < abc-file\n"
parallel -a - -a def-file echo <abc-file
echo
printf "parallel echo :::: - def-file < abc-file\n"
parallel echo :::: - def-file <abc-file
echo
printf "parallel echo ::: A B C :::: def-file\n"
parallel echo ::: A B C :::: def-file
echo
printf "parallel --link echo ::: A B C ::: D E F\n"
parallel --link echo ::: A B C ::: D E F
echo
printf "parallel --link echo ::: A B C D E ::: F G\n"
parallel --link echo ::: A B C D E ::: F G
echo
printf "parallel echo :::: abc-file :::+ G H I :::: def-file\n"
parallel echo :::: abc-file :::+ G H I :::: def-file
echo
printf "parallel echo :::: abc-file ::: G H I ::::+ def-file\n"
parallel echo :::: abc-file ::: G H I ::::+ def-file
echo
printf "parallel echo ::: A B C D E :::+ F G\n"
parallel echo ::: A B C D E :::+ F G
echo
printf "parallel --arg-sep ,, echo ,, A B C :::: def-file\n"
parallel --arg-sep ,, echo ,, A B C :::: def-file
echo
printf "parallel --arg-file-sep // echo ::: A B C // def-file\n"
parallel --arg-file-sep // echo ::: A B C // def-file
echo
printf "parallel -d _ echo :::: abc_-file\n"
parallel -d _ echo :::: abc_-file
echo
printf "parallel -d '\0' echo :::: abc0-file\n"
parallel -d '\0' echo :::: abc0-file
echo
printf "parallel -E stop echo ::: A B stop C D\n"
parallel -E stop echo ::: A B stop C D
echo
printf "(echo 1; echo; echo 2) | parallel --no-run-if-empty echo\n"
(
  echo 1
  echo
  echo 2
) | parallel --no-run-if-empty echo
echo
