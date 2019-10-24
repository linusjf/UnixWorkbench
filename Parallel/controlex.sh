#!/usr/bin/env bash
echo
echo -e "/usr/bin/time parallel -N0 -j64 sleep 1 :::: num128\n"
/usr/bin/time parallel -N0 -j64 sleep 1 :::: num128
echo
echo -e "/usr/bin/time parallel -N0 sleep 1 :::: num128\n"
/usr/bin/time parallel -N0 sleep 1 :::: num128
echo
echo -e "/usr/bin/time parallel -N0 --jobs 200% sleep 1 :::: num128\n"
/usr/bin/time parallel -N0 --jobs 0 sleep 1 :::: num128
echo
echo -e "/usr/bin/time parallel -N0 --jobs 0 sleep 1 :::: num128\n" 
/usr/bin/time parallel -N0 --jobs 0 sleep 1 :::: num128
echo
echo -e "echo 50% > my_jobs\n"
echo 50% > my_jobs
echo
echo -e "/usr/bin/time parallel -N0 --jobs my_jobs sleep 1 :::: num128 &\n"
/usr/bin/time parallel -N0 --jobs my_jobs sleep 1 :::: num128 &
echo
echo -e "sleep 1\n"
sleep 1
echo
echo -e "echo 0 > my_jobs\n"
echo 0 > my_jobs
echo
echo wait
echo
wait
echo
echo -e "parallel --use-cpus-instead-of-cores -N0 sleep 1 :::: num8\n"
parallel --use-cpus-instead-of-cores -N0 sleep 1 :::: num8
echo
echo -e "parallel --shuf echo ::: 1 2 3 ::: a b c ::: A B C\n"
parallel --shuf echo ::: 1 2 3 ::: a b c ::: A B C
echo
echo -e "parallel --delay 2.5 echo Starting {}\;date ::: 1 2 3\n"
parallel --delay 2.5 echo Starting {}\;date ::: 1 2 3
echo
echo -e "parallel --timeout 4.1 sleep {}\; echo {} ::: 2 4 6 8\n"
parallel --timeout 4.1 sleep {}\; echo {} ::: 2 4 6 8
echo
echo -e "parallel --eta sleep ::: 1 3 2 2 1 3 3 2 1\n"
parallel --eta sleep ::: 1 3 2 2 1 3 3 2 1
echo
echo -e "parallel --progress sleep ::: 1 3 2 2 1 3 3 2 1\n"
parallel --progress sleep ::: 1 3 2 2 1 3 3 2 1
echo
echo -e "parallel --bar sleep ::: 1 3 2 2 1 3 3 2 1\n"
parallel --bar sleep ::: 1 3 2 2 1 3 3 2 1
echo
echo
echo -e "parallel --joblog /tmp/log exit ::: 1 2 3 0\n"
parallel --joblog /tmp/log exit ::: 1 2 3 0
echo -e "cat /tmp/log\n"
cat /tmp/log
echo -e "parallel --joblog /tmp/log exit ::: 1 2 3 0\n"
parallel --joblog /tmp/log exit ::: 1 2 3 0
echo -e "cat /tmp/log\n"
cat /tmp/log
echo -e "parallel --resume --joblog /tmp/log exit ::: 1 2 3 0 0 0\n"
parallel --resume --joblog /tmp/log exit ::: 1 2 3 0 0 0
echo -e "cat /tmp/log\n"
cat /tmp/log
echo
echo -e "parallel --resume-failed --joblog /tmp/log exit ::: 1 2 3 0 0 0\n"
parallel --resume-failed --joblog /tmp/log exit ::: 1 2 3 0 0 0
echo
echo -e "cat /tmp/log\n"
cat /tmp/log
echo
echo -e "parallel --retry-failed --joblog /tmp/log\n"
parallel --retry-failed --joblog /tmp/log
echo -e "cat /tmp/log\n"
cat /tmp/log
echo
echo -e "parallel -j2 --halt soon,fail=1 echo {}\; exit {} ::: 0 0 1 2 3\n"
parallel -j2 --halt soon,fail=1 echo {}\; exit {} ::: 0 0 1 2 3
echo
echo -e "parallel -j2 --halt now,fail=1 echo {}\; exit {} ::: 0 0 1 2 3\n"
parallel -j2 --halt now,fail=1 echo {}\; exit {} ::: 0 0 1 2 3
echo
echo -e "parallel -j2 --halt soon,fail=20% echo {}\; exit {} \
 ::: 0 1 2 3 4 5 6 7 8 9\n"
parallel -j2 --halt soon,fail=20% echo {}\; exit {} \
 ::: 0 1 2 3 4 5 6 7 8 9
echo
echo -e "parallel -j2 --halt now,success=1 echo {}\; exit {} ::: 1 2 3 0 4 5 6\n"
parallel -j2 --halt now,success=1 echo {}\; exit {} ::: 1 2 3 0 4 5 6
echo
echo -e "parallel -j2 --halt now,done=3 sleep {}\;echo {}\; exit {} \
 ::: 1 2 3 0 4 5 6\n"
parallel -j2 --halt now,done=3 sleep {}\;echo {}\; exit {} \
 ::: 1 2 3 0 4 5 6
echo
echo -e "parallel -k --retries 3 \
 'echo tried {} >>/tmp/runs; echo completed {}; exit {}' ::: 1 2 0\n" 
parallel -k --retries 3 \
 'echo tried {} >>/tmp/runs; echo completed {}; exit {}' ::: 1 2 0
echo
exit 0
