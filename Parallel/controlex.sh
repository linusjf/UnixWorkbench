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
exit 0
