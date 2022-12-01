#!/usr/bin/env -vS awk -f
BEGIN { 
DAY[1] = "Sunday"; 
DAY[2] = "Monday";
DAY[3] = "Tuesday"; 
DAY[4] = "Wednesday";
DAY[5] = "Thursday"; 
DAY[6] = "Friday";
DAY[7] = "Saturday";
if (ARGC < 4) { 
  printf ("Usage: %s month day year\n",ENVIRON["_"]);
  exit 1;
}
m = ARGV[1]+0;
d = ARGV[2]+0;
y = ARGV[3]+0;
while ("cal "m" "y| getline) { 
  if (NF==7)
    Sun = $1;
}
dow = (Sun + 14 - d)%7 
if (dow == 0) 
  dow = 7; 
dow = 8 - dow;
printf ("%d/%d/%d was a %s\n", m, d, y, DAY[dow]);
}
