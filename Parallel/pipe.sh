#!/usr/bin/env bash
printf "parallel --pipe wc < num1000000\n"
parallel --pipe wc <num1000000
echo
printf "parallel --pipe --block 2M wc < num1000000\n"
parallel --pipe --block 2M wc <num1000000
echo
printf "parallel --pipe -j4 --round-robin wc < num1000000\n"
parallel --pipe -j4 --round-robin wc <num1000000
echo
printf "parallel --pipe -j4 --keep-order --round-robin wc < num1000000\n"
parallel --pipe -j4 --keep-order --round-robin wc <num1000000
echo
printf "parallel --pipe -N140000 wc < num1000000\n"
parallel --pipe -N140000 wc <num1000000
echo
printf "parallel --pipe -L75 wc < num1000000\n"
parallel --keep-order --pipe -L75 wc <num1000000
echo
printf "echo /foo, bar/, /baz, qux/, | \
  parallel --dryrun -kN1 --recend ', ' --pipe echo \"JOB{#}\"\;cat\;echo END\n"
echo /foo, bar/, /baz, qux/, |
  parallel --dryrun -kN1 --recend ', ' --pipe echo "JOB{#}"\;cat\;echo END
echo
printf "echo -n '/foo, bar/, /baz, qux/, ' | \
  parallel -kN1 --recend ', ' --pipe echo \"JOB{#}\"\;cat\;echo END\n"
echo -n '/foo, bar/, /baz, qux/, ' |
  parallel -kN1 --recend ', ' --pipe echo "JOB{#}"\;cat\;echo END
echo
printf "echo -n '/foo, bar/, /baz, qux/, ' | \
  parallel -kN1 --recstart / --pipe echo \"JOB{#}\"\;cat\;echo END\n"
echo -n '/foo, bar/, /baz, qux/, ' |
  parallel -kN1 --recstart / --pipe echo "JOB{#}"\;cat\;echo END
echo
printf "echo /foo, bar/, /baz, qux/, | \
  parallel -kN1 --recend ', ' --recstart / --pipe \
  echo \"JOB{#}\"\;cat\;echo END\n"
echo -n '/foo, bar/, /baz, qux/, ' |
  parallel -kN1 --recend ', ' --recstart / --pipe \
    echo "JOB{#}"\;cat\;echo END
echo
printf "echo -n 'foo,bar,_baz,__qux ' | \
  parallel -kN1 --regexp --recend ,_* --pipe \
  echo \"JOB{#}\"\;cat\;echo END\n"
echo -n 'foo,bar,_baz,__qux ' |
  parallel -kN1 --regexp --recend ,_* --pipe \
    echo "JOB{#}"\;cat\;echo END
echo
printf "echo -n 'foo,bar,_baz,__qux' | \
  parallel -kN1 --rrs --regexp --recend ,_* --pipe \
  echo \"JOB{#}\"\;cat\;echo END\n"
echo -n 'foo,bar,_baz,__qux' |
  parallel -kN1 --rrs --regexp --recend ,_* --pipe \
    echo "JOB{#}"\;cat\;echo END
echo
printf "echo -n 'foo,bar,_baz,__qux' | \
  parallel -kN1 --rrs --regexp --recend ,_* --pipe \
  echo \"JOB{#}';'cat';'echo END\"\n"
echo -n 'foo,bar,_baz,__qux' |
  parallel -kN1 --rrs --regexp --recend ,_* --pipe \
    echo "JOB{#}';'cat';'echo END"
echo
printf "parallel --dryrun --header '(%%.*\n)*' --pipe -N3 echo \"JOB{#}\"\;cat <num_%%header\n"
parallel --dryrun --header '(%.*\n)*' --pipe -N3 echo "JOB{#}"\;cat <num_%header
echo
printf "parallel -k --header '(%%.*\n)*' --pipe -N3 echo \"JOB{#}\"\;cat < num_%%header\n"
parallel -k --header '(%.*\n)*' --pipe -N3 echo "JOB{#}"\;cat <num_%header
echo
printf "parallel --header 2 --pipe -N3 echo \"JOB{#}\"\;cat < num_%%header\n"
parallel --header 2 --pipe -N3 echo "JOB{#}"\;cat <num_%header
echo
printf "parallel --pipe --header .{4} --block 3 --recend '' \
  'echo start; cat; echo' <fixedlen\n"
parallel --pipe --header ."{4}" --block 3 --recend '' \
  'echo start; cat; echo' <fixedlen
echo
printf "parallel --pipe --cat wc {} < num1000000\n"
parallel --pipe --cat wc {} <num1000000
echo
printf "parallel --pipe --cat --gnu time wc {} < num1000000\n"
parallel --pipe --cat --gnu time wc {} <num1000000
echo
printf "parallel --pipe --fifo --gnu time wc {} < num1000000\n"
parallel --pipe --fifo --gnu time wc {} <num1000000
echo
printf "parallel --pipepart -a num1000000 --block 3m wc\n"
parallel --pipepart -a num1000000 --block 3m wc
echo
printf "parallel --pipepart -a num1000000 --block -3 -j5 -k wc\n"
parallel --pipepart -a num1000000 --block -3 -j5 -k wc
echo
printf "seq 1000 | parallel --dryrun --pipe --tee -v wc {} ::: -w -l -c\n"
seq 1000 | parallel --dryrun --pipe --tee -v wc {} ::: -w -l -c
echo
printf "seq 1000 | parallel --pipe --tee -v wc {} ::: -w -l -c\n"
seq 1000 | parallel --pipe --tee -v wc {} ::: -w -l -c
echo
printf "seq 30 | parallel --dryrun -v --pipe --tee --tag grep {} ::: 4 5 6\n"
seq 30 | parallel --dryrun -v --pipe --tee --tag grep {} ::: 4 5 6
echo
printf "seq 30 | parallel -v --pipe --tee --tag grep {} ::: 4 5 6\n"
seq 30 | parallel -v --pipe --tee --tag grep {} ::: 4 5 6
echo
exit 0
