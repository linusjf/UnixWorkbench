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
