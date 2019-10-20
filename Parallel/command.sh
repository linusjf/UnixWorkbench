#!/usr/bin/env bash
echo -e "parallel ::: ls 'echo foo' pwd\n"
parallel ::: ls 'echo foo' pwd
echo
echo -e "my_func() {
 echo in my_func $1
}
export -f my_func
parallel my_func ::: 1 2 3\n"
# Only works in Bash
my_func() {
 echo in my_func $1
}
export -f my_func
parallel my_func ::: 1 2 3
echo
echo -e "parallel echo ::: A/B.C\n"
parallel echo ::: A/B.C
echo
echo -e "parallel echo {} ::: A/B.C\n"
parallel echo {} ::: A/B.C
echo
echo -e "parallel echo {.} ::: A/B.C\n" 
parallel echo {.} ::: A/B.C
echo
echo -e "parallel echo {/} ::: A/B.C\n"
parallel echo {/} ::: A/B.C
echo
echo -e "parallel echo {//} ::: A/B.C\n"
parallel echo {//} ::: A/B.C
echo
echo -e "parallel echo {/.} ::: A/B.C\n"
parallel echo {/.} ::: A/B.C
echo
echo -e "parallel echo {#} ::: A B C\n"
parallel echo {#} ::: A B C
echo
echo -e "parallel -j 2 echo {%} ::: A B C\n"
parallel -j 2 echo {%} ::: A B C
echo
echo -e "echo 'No \" needed/nThat's right' | parallel echo {}\n"
echo -e 'No " needed\nThat'"'s right" | parallel echo {}
echo
echo -e "'echo foo; echo bar' | parallel echo baz\; eval {}\n"
echo 'echo foo; echo bar' | parallel echo baz\; eval {}
echo
echo -e "parallel -I ,, echo ,, ::: A/B.C\n"
parallel -I ,, echo ,, ::: A/B.C
echo
echo -e "parallel --extensionreplace ,, echo ,, ::: A/B.C\n"
parallel --extensionreplace ,, echo ,, ::: A/B.C
echo
echo -e "parallel --basenamereplace ,, echo ,, ::: A/B.C\n"
parallel --basenamereplace ,, echo ,, ::: A/B.C
echo
echo -e "parallel --dirnamereplace ,, echo ,, ::: A/B.C\n"
parallel --dirnamereplace ,, echo ,, ::: A/B.C
echo
echo -e "parallel --basenameextensionreplace ,, echo ,, ::: A/B.C\n"
parallel --basenameextensionreplace ,, echo ,, ::: A/B.C
echo
echo -e "parallel --seqreplace ,, echo ,, ::: A B C\n"
parallel --seqreplace ,, echo ,, ::: A B C
echo
echo -e "parallel -j2 --slotreplace ,, echo ,, ::: A B C\n"
parallel -j2 --slotreplace ,, echo ,, ::: A B C
echo
echo -e "parallel echo '{= s:\.[^.]+$::;s:\.[^.]+$::; =}' ::: foo.tar.gz\n"
parallel echo '{= s:\.[^.]+$::;s:\.[^.]+$::; =}' ::: foo.tar.gz
echo
echo -e "parallel echo '{= s:\.[^.]+\.[^.]+$::; =}' ::: foo.tar.gz\n"
parallel echo '{= s:\.[^.]+\.[^.]+$::; =}' ::: foo.tar.gz
echo
echo -e "parallel echo Job {#} of {= '$_=total_jobs()' =} ::: {1..5}\n"
parallel echo Job {#} of {= '$_=total_jobs()' =} ::: {1..5}
echo
echo -e "parallel -j2 echo The job slot is {%} = {= '$_=slot()' =} ::: {1..5}\n"
parallel -j2 echo The job slot is {%} = {= '$_=slot()' =} ::: {1..5}
echo
echo -e "parallel -j2 echo The job slot is {%} = {= '$_=slot()' =} ::: {1..5}\n"
parallel -j2 echo The job slot for {} = {= '$_=slot()' =} ::: {1..5}
echo
echo -e "parallel echo Job {#} = {= '$_=seq()' =} ::: a b c\n"
parallel echo Job {#} = {= '$_=seq()' =} ::: a b c
echo
echo -e "parallel echo Job {#} = {= '$_=seq()' =} ::: a b c\n"
parallel echo Job {#} = {= '$_=seq()' =} ::: a b c
echo
echo -e "parallel echo Sequence {} has Job {= '$_=seq()' =} ::: a b c\n"
parallel echo Sequence {} has Job {= '$_=seq()' =} ::: a b c
echo
echo -e "parallel echo {} shell quoted is {= '\$_=Q(\$_)' =} ::: '*/!#$'\n"
parallel echo {} shell quoted is {= '$_=Q($_)' =} ::: '*/!#$'
echo
echo -e "parallel echo {= 'if(\$_==3) { skip() }' =} ::: {1..5}\n"
parallel echo {= 'if($_==3) { skip() }' =} ::: {1..5}
echo
echo -e "parallel echo {= 'if(\$arg[1]==\$arg[2]) { skip() }' =} \
 ::: {1..3} ::: {1..3}\n"
parallel echo {= 'if($arg[1]==$arg[2]) { skip() }' =} \
 ::: {1..3} ::: {1..3}
echo
echo -e "parallel --parens ,,,, echo ',, s:\.[^.]+$::;s:\.[^.]+$::; ,,' \
 ::: foo.tar.gz\n"
parallel --parens ,,,, echo ',, s:\.[^.]+$::;s:\.[^.]+$::; ,,' \
 ::: foo.tar.gz
echo
echo -e "parallel --rpl '.. s:\.[^.]+$::;s:\.[^.]+$::;' echo '..' \
 ::: foo.tar.gz\n"
parallel --rpl '.. s:\.[^.]+$::;s:\.[^.]+$::;' echo '..' \
 ::: foo.tar.gz
echo
exit 0
