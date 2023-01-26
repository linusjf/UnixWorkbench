#!/usr/bin/env bash
echo
printf "time parallel -N0 -j64 sleep 1 :::: num128\n"
time parallel -N0 -j64 sleep 1 :::: num128
echo
printf "time parallel -N0 sleep 1 :::: num128\n"
time parallel -N0 sleep 1 :::: num128
echo
printf "time parallel -N0 --jobs 200%% sleep 1 :::: num128\n"
time parallel -N0 --jobs 0 sleep 1 :::: num128
echo
printf "time parallel -N0 --jobs 0 sleep 1 :::: num128\n"
time parallel -N0 --jobs 0 sleep 1 :::: num128
echo
printf "echo 50%% > my_jobs\n"
echo 50% >my_jobs
echo
printf "time parallel -N0 --jobs my_jobs sleep 1 :::: num128 &\n"
time parallel -N0 --jobs my_jobs sleep 1 :::: num128 &
echo
printf "sleep 1\n"
sleep 1
echo
printf "echo 0 > my_jobs\n"
echo 0 >my_jobs
echo
echo wait
echo
wait
echo
printf "parallel --use-cpus-instead-of-cores -N0 sleep 1 :::: num8\n"
parallel --use-cpus-instead-of-cores -N0 sleep 1 :::: num8
echo
printf "parallel --shuf echo ::: 1 2 3 ::: a b c ::: A B C\n"
parallel --shuf echo ::: 1 2 3 ::: a b c ::: A B C
echo
printf "parallel --delay 2.5 echo Starting {}\;date ::: 1 2 3\n"
parallel --delay 2.5 echo Starting {}\;date ::: 1 2 3
echo
printf "parallel --timeout 4.1 sleep {}\; echo {} ::: 2 4 6 8\n"
parallel --timeout 4.1 sleep {}\; echo {} ::: 2 4 6 8
echo
printf "parallel --eta sleep ::: 1 3 2 2 1 3 3 2 1\n"
parallel --eta sleep ::: 1 3 2 2 1 3 3 2 1
echo
printf "parallel --progress sleep ::: 1 3 2 2 1 3 3 2 1\n"
parallel --progress sleep ::: 1 3 2 2 1 3 3 2 1
echo
printf "parallel --bar sleep ::: 1 3 2 2 1 3 3 2 1\n"
parallel --bar sleep ::: 1 3 2 2 1 3 3 2 1
echo
echo
printf "parallel --joblog %s/tmp/log/ exit ::: 1 2 3 0\n" "$PREFIX"
parallel --joblog "${PREFIX}/tmp/log" exit ::: 1 2 3 0
printf "cat %s/tmp/log\n" "$PREFIX"
cat "$PREFIX/tmp/log"
printf "parallel --joblog %s/tmp/log exit ::: 1 2 3 0\n" "$PREFIX"
parallel --joblog "${PREFIX}/tmp/log" exit ::: 1 2 3 0
printf "cat %s/tmp/log\n" "$PREFIX"
cat "$PREFIX/tmp/log"
printf "parallel --resume --joblog %s/tmp/log exit ::: 1 2 3 0 0 0\n" "$PREFIX"
parallel --resume --joblog "${PREFIX}/tmp/log" exit ::: 1 2 3 0 0 0
printf "cat %s/tmp/log\n" "$PREFIX"
cat "${PREFIX}/tmp/log"
echo
printf "parallel --resume-failed --joblog %s/tmp/log exit ::: 1 2 3 0 0 0\n" "$PREFIX"
parallel --resume-failed --joblog "${PREFIX}/tmp/log" exit ::: 1 2 3 0 0 0
echo
printf "cat %s/tmp/log\n" "$PREFIX"
cat "${PREFIX}/tmp/log"
echo
printf "parallel --retry-failed --joblog %s/tmp/log\n" "$PREFIX"
parallel --retry-failed --joblog "${PREFIX}/tmp/log"
printf "cat %s/tmp/log\n" "$PREFIX"
cat "${PREFIX}/tmp/log"
echo
printf "parallel -j2 --halt soon,fail=1 echo {}\; exit {} ::: 0 0 1 2 3\n"
parallel -j2 --halt soon,fail=1 echo {}\; exit {} ::: 0 0 1 2 3
echo
printf "parallel -j2 --halt now,fail=1 echo {}\; exit {} ::: 0 0 1 2 3\n"
parallel -j2 --halt now,fail=1 echo {}\; exit {} ::: 0 0 1 2 3
echo
printf "parallel -j2 --halt soon,fail=20%% echo {}\; exit {} \
  ::: 0 1 2 3 4 5 6 7 8 9\n"
parallel -j2 --halt soon,fail=20% echo {}\; exit {} \
  ::: 0 1 2 3 4 5 6 7 8 9
echo
printf "parallel -j2 --halt now,success=1 echo {}\; exit {} ::: 1 2 3 0 4 5 6\n"
parallel -j2 --halt now,success=1 echo {}\; exit {} ::: 1 2 3 0 4 5 6
echo
printf "parallel -j2 --halt now,done=3 sleep {}\;echo {}\; exit {} \
  ::: 1 2 3 0 4 5 6\n"
parallel -j2 --halt now,done=3 sleep {}\;echo {}\; exit {} \
  ::: 1 2 3 0 4 5 6
echo
printf "parallel -k --retries 3 \
  \"echo tried {} >>%s/tmp/runs; echo completed {}; exit {}\" ::: 1 2 0\n" "$PREFIX"
parallel -k --retries 3 \
  "echo tried {} >>${PREFIX}/tmp/runs; echo completed {}; exit {}" ::: 1 2 0
printf "cat %s/tmp/runs\n" "$PREFIX"
cat "$PREFIX/tmp/runs"
echo
printf "function show_signals() {
  perl -e 'for(keys %%SIG) {
  $SIG{$_} = eval \"sub { print \"Got \$_\\n\"; }\";
}while(1){sleep 1}'
}"
#shellcheck disable=SC2317
function show_signals() {
  perl -e 'for(keys %SIG) {
  $SIG{$_} = eval "sub { print \"Got $_\\n\"; }";
}
while(1){sleep 1}'
}
export -f show_signals
printf "printf | parallel --termseq TERM,200,TERM,100,TERM,50,KILL,25 \
  -u --timeout 1 show_signals"
printf | parallel --termseq TERM,200,TERM,100,TERM,50,KILL,25 \
  -u --timeout 1 show_signals
echo
printf "echo | parallel -u --timeout 1 show_signals\n"
echo | parallel -u --timeout 1 show_signals
echo
printf "echo | parallel --termseq INT,200,TERM,100,KILL,25 \
  -u --timeout 1 show_signals\n"
echo | parallel --termseq INT,200,TERM,100,KILL,25 \
  -u --timeout 1 show_signals
echo
printf "parallel --nice 17 echo this is being run with nice -n ::: 17\n"
parallel --nice 17 echo this is being run with nice -n ::: 17
echo
printf "parallel --load 100%% echo load is less than {} job per CPU ::: 1\n"
parallel --load 100% echo load is less than {} job per CPU ::: 1
echo
printf "parallel --noswap echo the system is not swapping ::: now\n"
parallel --noswap echo the system is not swapping ::: now
echo
printf "parallel --memfree 1G --retries 5 echo More than 1 GB is ::: free\n"
parallel --memfree 1G --retries 5 echo More than 1 GB is ::: free
echo
#printf "parallel --limit \"io 10\" echo ::: less than 10% disk I/O\n"
#parallel --limit "io 10" echo ::: less than 10% disk I/O
echo
printf "parallel --limit \"mem 1g\" echo ::: more than 10G free\n"
parallel --limit "mem 1g" echo ::: more than 10G free
echo
printf "parallel --limit \"load 3\" echo ::: less than 3 procs running\n"
parallel --limit "load 3" echo ::: less than 3 procs running
echo
exit 0
