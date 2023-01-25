#!/usr/bin/env bash
printf "parallel --tag echo \"foo-{}\" ::: A B C\n"
parallel --tag echo "foo-{}" ::: A B C
echo
printf "parallel --tagstring {}-bar echo \"foo-{}\" ::: A B C\n"
parallel --tagstring {}-bar echo "foo-{}" ::: A B C
echo
printf "parallel --dryrun echo \"{}\" ::: A B C\n"
parallel --dryrun echo "{}" ::: A B C
echo
printf "parallel --verbose echo \"{}\" ::: A B C\n"
parallel --verbose echo "{}" ::: A B C
echo
printf "half_line_print() {
printf \"%%s-start\n%%s\" \$1 \$1
sleep \$1
printf \"%%s\n\" -middle
echo \"\$1-end\"
}
export -f half_line_print\n"
function half_line_print() {
  printf "%s-start\n%s" "$1" "$1"
  sleep "$1"
  printf "%s\n" -middle
  echo "${1}-end"
}
export -f half_line_print
half_line_print "10"
echo
printf "parallel -j2 half_line_print ::: 4 2 1\n"
parallel -j2 half_line_print ::: 4 2 1
echo
printf "parallel -j2 -k half_line_print ::: 4 2 1\n"
parallel -j2 -k half_line_print ::: 4 2 1
echo
printf "parallel -j2 half_line_print ::: 4 2 1\n"
parallel -j2 half_line_print ::: 4 2 1
echo
printf "parallel -j2 --ungroup half_line_print ::: 4 2 1\n"
parallel -j2 --ungroup half_line_print ::: 4 2 1
echo
printf "parallel -j2 --linebuffer half_line_print ::: 4 2 1\n"
parallel -j2 --linebuffer half_line_print ::: 4 2 1
echo
printf "parallel -j4 'echo {}-a;sleep {};echo {}-b' ::: 1 3 2 4\n"
parallel -j4 'echo {}-a;sleep {};echo {}-b' ::: 1 3 2 4
echo
printf "parallel -j4 --line-buffer 'echo {}-a;sleep {};echo {}-b' ::: 1 3 2 4\n"
parallel -j4 --line-buffer 'echo {}-a;sleep {};echo {}-b' ::: 1 3 2 4
echo
printf "parallel -j4 -k --line-buffer 'echo {}-a;sleep {};echo {}-b' ::: 1 3 2 4\n"
parallel -j4 -k --line-buffer 'echo {}-a;sleep {};echo {}-b' ::: 1 3 2 4
echo
printf "parallel --files echo ::: A B C\n"
parallel --files echo ::: A B C
echo
printf "parallel --tmpdir \"\${PREFIX}/var/tmp\" --files echo ::: A B C\n"
parallel --tmpdir "${PREFIX}/var/tmp" --files echo ::: A B C
echo
printf "TMPDIR=\"%s/var/tmp\" parallel --files echo ::: A B C\n" "$PREFIX"
TMPDIR="${PREFIX}/var/tmp" parallel --files echo ::: A B C
echo
printf "parallel --results outdir echo ::: A B C\n"
parallel --results outdir echo ::: A B C
echo
printf "parallel --header : --results outdir echo ::: f1 A B ::: f2 C D\n"
parallel --header : --results outdir echo ::: f1 A B ::: f2 C D
echo
printf "parallel --results \"my{1}-{2}.out\" echo ::: A B ::: C D\n"
parallel --results "my{1}-{2}.out" echo ::: A B ::: C D
echo
printf "parallel --results \"my{1}-{2}-dir/\" echo ::: A B ::: C D\n"
parallel --results "my{1}-{2}-dir/" echo ::: A B ::: C D
echo
printf "parallel --results my.csv echo ::: A B ::: C D\n"
parallel --results my.csv echo ::: A B ::: C D
echo
exit 0
