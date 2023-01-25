#!/usr/bin/env bash
printf "parallel ::: ls 'echo foo' pwd\n"
parallel ::: ls 'echo foo' pwd
echo
printf "my_func() {
printf \"in my_func %%s\\n\" \"\$1\"
}
export -f my_func
parallel my_func ::: 1 2 3\n"
# Only works in Bash
function my_func() {
  printf "in my_func %s\n" "$1"
}
my_func 1
export -f my_func
parallel my_func ::: 1 2 3
echo
printf "parallel echo ::: A/B.C\n"
parallel echo ::: A/B.C
echo
printf "parallel echo {} ::: A/B.C\n"
parallel echo {} ::: A/B.C
echo
printf "parallel echo \"{.}\" ::: A/B.C\n"
parallel echo "{.}" ::: A/B.C
echo
printf "parallel echo \"{/}\" ::: A/B.C\n"
parallel echo "{/}" ::: A/B.C
echo
printf "parallel echo \"{//}\" ::: A/B.C\n"
parallel echo "{//}" ::: A/B.C
echo
printf "parallel echo \"{/.}\" ::: A/B.C\n"
parallel echo "{/.}" ::: A/B.C
echo
printf "parallel echo \"{#}\" ::: A B C\n"
parallel echo "{#}" ::: A B C
echo
printf "parallel -j 2 echo \"{%%}\" ::: A B C\n"
parallel -j 2 echo "{%}" ::: A B C
echo
printf "echo 'No \" needed/nThat's right' | parallel echo {}\n"
printf 'No " needed\nThat'"'s right" | parallel echo {}
echo
printf "'echo foo; echo bar' | parallel echo baz\; eval {}\n"
echo 'echo foo; echo bar' | parallel echo baz\; eval {}
echo
printf "parallel -I ,, echo ,, ::: A/B.C\n"
parallel -I ,, echo ,, ::: A/B.C
echo
printf "parallel --extensionreplace ,, echo ,, ::: A/B.C\n"
parallel --extensionreplace ,, echo ,, ::: A/B.C
echo
printf "parallel --basenamereplace ,, echo ,, ::: A/B.C\n"
parallel --basenamereplace ,, echo ,, ::: A/B.C
echo
printf "parallel --dirnamereplace ,, echo ,, ::: A/B.C\n"
parallel --dirnamereplace ,, echo ,, ::: A/B.C
echo
printf "parallel --basenameextensionreplace ,, echo ,, ::: A/B.C\n"
parallel --basenameextensionreplace ,, echo ,, ::: A/B.C
echo
printf "parallel --seqreplace ,, echo ,, ::: A B C\n"
parallel --seqreplace ,, echo ,, ::: A B C
echo
printf "parallel -j2 --slotreplace ,, echo ,, ::: A B C\n"
parallel -j2 --slotreplace ,, echo ,, ::: A B C
echo
printf "parallel echo '{= s:\.[^.]+$::;s:\.[^.]+$::; =}' ::: foo.tar.gz\n"
parallel echo '{= s:\.[^.]+$::;s:\.[^.]+$::; =}' ::: foo.tar.gz
echo
printf "parallel echo '{= s:\.[^.]+\.[^.]+$::; =}' ::: foo.tar.gz\n"
parallel echo '{= s:\.[^.]+\.[^.]+$::; =}' ::: foo.tar.gz
echo
printf "parallel echo Job \"{#}\" of \"{= '\$_=total_jobs()' =}\" ::: {1..5}\n"
parallel echo Job "{#}" of "{= '$_=total_jobs()' =}" ::: {1..5}
echo
printf "parallel -j2 echo The job slot is \"{%%}\" = \"{= '$_=slot()' =}\" ::: {1..5}\n"
parallel -j2 echo The job slot is "{%}" = "{= '$_=slot()' =}" ::: {1..5}
echo
printf "parallel -j2 echo The job slot is \"{%%}\" = \"{= '\$_=slot()' =}\" ::: {1..5}\n"
parallel -j2 echo The job slot for "{}" = "{= '$_=slot()' =}" ::: {1..5}
echo
printf "parallel echo Job \"{#}\" = \"{= '\$_=seq()' =}\" ::: a b c\n"
parallel echo Job "{#}" = "{= '$_=seq()' =}" ::: a b c
echo
printf "parallel echo Job \"{#}\" = \"{= '\$_=seq()' =}\" ::: a b c\n"
parallel echo Job "{#}" = "{= '$_=seq()' =}" ::: a b c
echo
printf "parallel echo \"Sequence {} has Job {= '\$_=seq()' =}\" ::: a b c\n"
parallel echo "Sequence {} has Job {= '$_=seq()' =}" ::: a b c
echo
printf "parallel echo \"{} shell quoted is {= '\$_=Q(\$_)' =}\" ::: '*/!#$'\n"
parallel echo "{} shell quoted is {= '$_=Q($_)' =}" ::: '*/!#$'
echo
printf "parallel echo \"{= 'if(\$_==3) { skip() }' =}\" ::: {1..5}\n"
parallel echo "{= 'if($_==3) { skip() }' =}" ::: {1..5}
echo
printf "parallel echo \"{= 'if(\${arg[1]}==\${arg[2]}) { skip() }' =}\" \
  ::: {1..3} ::: {1..3}\n"
#shellcheck disable=SC2154
parallel echo "{= 'if(${arg[1]}==${arg[2]}) { skip() }' =}" \
  ::: {1..3} ::: {1..3}
echo
printf "parallel --parens ,,,, echo ',, s:\.[^.]+$::;s:\.[^.]+$::; ,,' \
  ::: foo.tar.gz\n"
parallel --parens ,,,, echo ',, s:\.[^.]+$::;s:\.[^.]+$::; ,,' \
  ::: foo.tar.gz
echo
printf "parallel --rpl '.. s:\.[^.]+$::;s:\.[^.]+$::;' echo '..' \
  ::: foo.tar.gz\n"
parallel --rpl '.. s:\.[^.]+$::;s:\.[^.]+$::;' echo '..' \
  ::: foo.tar.gz
echo
printf "parallel --rpl \"'{%%(.+?)} s/\$\$1\$//;'\" echo \"{%%.tar.gz}\".zip ::: foo.tar.gz\n"
parallel --rpl "{%(.+?)} s/$$1$//;" echo "{%.tar.gz}".zip ::: foo.tar.gz
echo
printf "parallel --rpl \"{/(.+?)/(.*?)} s/\$\$1/\$\$2/;\" echo \"{/tar.gz/zip}\" \
  ::: foo.tar.gz\n"
parallel --rpl "{/(.+?)/(.*?)} s/$$1/$$2/;" echo "{/tar.gz/zip}" \
  ::: foo.tar.gz
echo
printf "parallel echo \"{1} and {2}\" ::: A B ::: C D\n"
parallel echo "{1} and {2}" ::: A B ::: C D
echo
printf "parallel echo \"/={1/} //={1//} /.={1/.} .={1.}\" ::: mydir/mysubdir/myfile.ext yourdir/yoursubdir/yourfile.yourext\n"
parallel echo "/={1/} //={1//} /.={1/.} .={1.}" ::: mydir/mysubdir/myfile.ext yourdir/yoursubdir/yourfile.yourext
echo
printf "parallel echo \"1={1} 2={2} 3={3} -1={-1} -2={-2} -3={-3}\" \
  ::: A B ::: C D ::: E F\n"
parallel echo "1={1} 2={2} 3={3} -1={-1} -2={-2} -3={-3}" \
  ::: A B ::: C D ::: E F
echo
printf "parallel echo '{=2 s:\.[^.]+$::;s:\.[^.]+$::; =} {1}' \
  ::: bar ::: foo.tar.gz\n"
parallel echo '{=2 s:\.[^.]+$::;s:\.[^.]+$::; =} {1}' \
  ::: bar ::: foo.tar.gz
echo
printf "parallel echo '{=1 s:\.[^.]+$::;s:\.[^.]+$::; =} {2}' \
  ::: foo.tar.gz ::: bar\n"
parallel echo '{=1 s:\.[^.]+$::;s:\.[^.]+$::; =} {2}' \
  ::: foo.tar.gz ::: bar
echo
printf "parallel --colsep '/t' echo \"1={1} 2={2}\" :::: tsv-file.tsv\n"
parallel --colsep '\t' echo "1={1} 2={2}" :::: tsv-file.tsv
echo
printf "parallel --plus echo \"{}\" ::: dir/sub/file.ex1.ex2.ex3\n"
parallel --plus echo "{}" ::: dir/sub/file.ex1.ex2.ex3
echo
printf "parallel --plus echo \"{+/}/{/}\" ::: dir/sub/file.ex1.ex2.ex3\n"
parallel --plus echo "{+/}/{/}" ::: dir/sub/file.ex1.ex2.ex3
echo
printf "parallel --plus echo \"{.}.{+.}\" ::: dir/sub/file.ex1.ex2.ex3\n"
parallel --plus echo "{.}.{+.}" ::: dir/sub/file.ex1.ex2.ex3
echo
printf "parallel --plus echo \"{+/}/{/.}.{+.}\" ::: dir/sub/file.ex1.ex2.ex3\n"
parallel --plus echo "{+/}/{/.}.{+.}" ::: dir/sub/file.ex1.ex2.ex3
echo
printf "parallel --plus echo \"{..}.{+..}\" ::: dir/sub/file.ex1.ex2.ex3\n"
parallel --plus echo "{..}.{+..}" ::: dir/sub/file.ex1.ex2.ex3
echo
printf "parallel --plus echo \"{+/}/{/..}.{+..}\" ::: dir/sub/file.ex1.ex2.ex3\n"
parallel --plus echo "{+/}/{/..}.{+..}" ::: dir/sub/file.ex1.ex2.ex3
echo
printf "parallel --plus echo \"{...}.{+...}\" ::: dir/sub/file.ex1.ex2.ex3\n"
parallel --plus echo "{...}.{+...}" ::: dir/sub/file.ex1.ex2.ex3
echo
printf "parallel --plus echo \"{+/}/{/...}.{+...}\" ::: dir/sub/file.ex1.ex2.ex3\n"
parallel --plus echo "{+/}/{/...}.{+...}" ::: dir/sub/file.ex1.ex2.ex3
echo
printf "parallel --plus echo \"Job {#} of {##}\" ::: {1..5}\n"
parallel --plus echo "Job {#} of {##}" ::: {1..5}
echo
printf "unset myvar\n"
unset myvar
echo
printf "echo \${myvar:-myval}\n"
echo "${myvar:-myval}"
echo
printf "parallel --plus echo \"{:-myval}\" ::: '\$myvar'\n"
parallel --plus echo "{:-myval}" ::: "$myvar"
echo
printf "myvar=abcAaAdef\n"
myvar=abcAaAdef
echo
printf "echo \${myvar:2}\n"
echo ${myvar:2}
echo
printf "parallel --plus echo \"{:2}\" ::: '\$myvar'\n"
parallel --plus echo "{:2}" ::: "$myvar"
echo
printf "echo \${myvar:2:3}\n"
echo ${myvar:2:3}
echo
printf "parallel --plus echo \"{:2:3}\" ::: '\$myvar'\n"
parallel --plus echo "{:2:3}" ::: "$myvar"
echo
printf "echo \${myvar#bc}\n"
echo ${myvar#bc}
echo
printf "parallel --plus echo \"{#bc}\" ::: '\$myvar'\n"
parallel --plus echo "{#bc}" ::: "$myvar"
echo
printf "echo \${myvar#abc}\n"
echo ${myvar#abc}
echo
printf "parallel --plus echo \"{#abc}\" ::: '\$myvar'\n"
parallel --plus echo "{#abc}" ::: "$myvar"
echo
printf "parallel --xargs 'echo {} | wc -w' < num30000\n"
parallel --xargs 'echo {} | wc -w' <num30000
echo
printf "parallel --xargs -s 30000 'echo {} | wc -w' <num30000\n"
parallel --xargs -s 30000 'echo {} | wc -w' <num30000
echo
printf "parallel -j 4 -m 'echo {} | wc -w' <num30000\n"
parallel -j 4 -m 'echo {} | wc -w' <num30000
echo
printf "parallel --jobs 4 -m echo ::: 1 2 3 4 5 6 7 8 9 10\n"
parallel --jobs 4 -m echo ::: 1 2 3 4 5 6 7 8 9 10
echo
printf "parallel --jobs 4 -m echo pre-{}-post ::: A B C D E F G\n"
parallel --jobs 4 -m echo pre-{}-post ::: A B C D E F G
echo
printf "parallel --jobs 4 -X echo pre-{}-post ::: A B C D E F G\n"
parallel --jobs 4 -X echo pre-{}-post ::: A B C D E F G
echo
printf "parallel -N3 echo ::: A B C D E F G H\n"
parallel -N3 echo ::: A B C D E F G H
echo
printf "parallel -N3 echo \"1={1} 2={2} 3={3}\" ::: A B C D E F G H\n"
parallel -N3 echo "1={1} 2={2} 3={3}" ::: A B C D E F G H
echo
printf "parallel -N0 echo foo ::: 1 2 3\n"
parallel -N0 echo foo ::: 1 2 3
echo
printf "perl -e 'print \"@ARGV/n\"' A\n"
perl -e 'print "@ARGV\n"' A
echo
printf "parallel perl -e 'print \"@ARGV/n\"' ::: This wont work\n"
parallel perl -e 'print "@ARGV/n"' ::: This wont work
echo
printf "parallel -q perl -e 'print \"@ARGV/n\"' ::: This works\n"
parallel -q perl -e 'print "@ARGV\n"' ::: This works
echo
printf "parallel perl -e \''print \"@ARGV/n\"'\' ::: This works, too\n"
parallel perl -e \''print "@ARGV\n"'\' ::: This works, too
echo
printf "parallel perl -e \''print \"@ARGV:\"'\' ::: This works, too\n"
parallel perl -e \''print "@ARGV:"'\' ::: This works, too
echo
printf "parallel --shellquote < shellquote.txt\n"
parallel --shellquote <shellquote.txt
echo
printf "parallel perl\ -e\ \'print\ \"@ARGV\\n\"\' ::: This also works\n"
parallel perl\ -e\ \'print\ \"@ARGV\\n\"\' ::: This also works
echo
exit 0
