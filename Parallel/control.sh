#!/usr/bin/env bash
echo -e "parallel --tag echo foo-{} ::: A B C\n"
parallel --tag echo foo-{} ::: A B C
echo
echo -e "parallel --tagstring {}-bar echo foo-{} ::: A B C\n"
parallel --tagstring {}-bar echo foo-{} ::: A B C
echo
echo -e "parallel --dryrun echo {} ::: A B C\n"
parallel --dryrun echo {} ::: A B C
echo
echo -e "parallel --verbose echo {} ::: A B C\n"
parallel --verbose echo {} ::: A B C
echo
echo -e "half_line_print() {
 printf \"%s-start\n%s\" \$1 \$1
 sleep \$1
 printf \"%s\n\" -middle
 echo \$1-end
}
export -f half_line_print"
half_line_print() {
 printf "%s-start\n%s" $1 $1
 sleep $1
 printf "%s\n" -middle
 echo $1-end
}
export -f half_line_print
echo
echo -e "parallel -j2 half_line_print ::: 4 2 1\n"
parallel -j2 half_line_print ::: 4 2 1
echo
echo -e "parallel -j2 -k half_line_print ::: 4 2 1\n"
parallel -j2 -k half_line_print ::: 4 2 1
echo
echo -e "parallel -j2 half_line_print ::: 4 2 1\n"
parallel -j2 half_line_print ::: 4 2 1
echo
echo -e "parallel -j2 --ungroup half_line_print ::: 4 2 1\n"
parallel -j2 --ungroup half_line_print ::: 4 2 1
echo
exit 0
