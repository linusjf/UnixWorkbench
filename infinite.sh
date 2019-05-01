nice -n 19 bash
until [ $COUNT -lt 1 ]; do
  let COUNT=`cat /proc/sys/kernel/random/entropy_avail`
  echo "`date` COUNTER $COUNT"
done
