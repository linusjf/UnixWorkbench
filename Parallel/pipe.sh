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
echo -e "cat num1000000 | parallel --pipe -N140000 wc\n"  
cat num1000000 | parallel --pipe -N140000 wc
echo
echo -e "cat num1000000 | parallel --pipe -L75 wc\n"
cat num1000000 | parallel --keep-order --pipe -L75 wc
echo
echo -e "echo /foo, bar/, /baz, qux/, | \
 parallel --dryrun -kN1 --recend ', ' --pipe echo JOB{#}\;cat\;echo END\n"
echo /foo, bar/, /baz, qux/, | \
 parallel --dryrun -kN1 --recend ', ' --pipe echo JOB{#}\;cat\;echo END
echo
echo -e "echo -n '/foo, bar/, /baz, qux/, ' | \
 parallel -kN1 --recend ', ' --pipe echo JOB{#}\;cat\;echo END\n"
echo -n '/foo, bar/, /baz, qux/, ' | \
 parallel -kN1 --recend ', ' --pipe echo JOB{#}\;cat\;echo END
echo
echo -e "echo -n '/foo, bar/, /baz, qux/, ' | \
 parallel -kN1 --recstart / --pipe echo JOB{#}\;cat\;echo END\n"
echo -n '/foo, bar/, /baz, qux/, ' | \
 parallel -kN1 --recstart / --pipe echo JOB{#}\;cat\;echo END
echo
echo -e "echo /foo, bar/, /baz, qux/, | \
 parallel -kN1 --recend ', ' --recstart / --pipe \
 echo JOB{#}\;cat\;echo END\n"
echo -n '/foo, bar/, /baz, qux/, ' | \
 parallel -kN1 --recend ', ' --recstart / --pipe \
 echo JOB{#}\;cat\;echo END
echo
echo -e "echo -n 'foo,bar,_baz,__qux ' | \
 parallel -kN1 --regexp --recend ,_* --pipe \
 echo JOB{#}\;cat\;echo END\n"
echo -n 'foo,bar,_baz,__qux ' | \
 parallel -kN1 --regexp --recend ,_* --pipe \
 echo JOB{#}\;cat\;echo END
echo
echo -e "echo -n 'foo,bar,_baz,__qux' | \
 parallel -kN1 --rrs --regexp --recend ,_* --pipe \
 echo JOB{#}\;cat\;echo END\n"
echo -n 'foo,bar,_baz,__qux' | \
 parallel -kN1 --rrs --regexp --recend ,_* --pipe \
 echo JOB{#}\;cat\;echo END
echo
echo -e "echo -n 'foo,bar,_baz,__qux' | \
 parallel -kN1 --rrs --regexp --recend ,_* --pipe \
 echo JOB{#}';'cat';'echo END\n"
echo -n 'foo,bar,_baz,__qux' | \
 parallel -kN1 --rrs --regexp --recend ,_* --pipe \
 echo JOB{#}';'cat';'echo END
echo
echo -e "cat num_%header | \
 parallel --header '(%.*\n)*' --pipe -N3 echo JOB{#}\;cat\n"
cat num_%header | \
 parallel --header '(%.*\n)*' --pipe -N3 echo JOB{#}\;cat
echo
exit 0
