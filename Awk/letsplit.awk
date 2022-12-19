#!/usr/bin/env -S awk -f
{ 
  split($1,DATE,"/") 
  n = split($2,TIME,":") 
  print "Month is "DATE[1] 
  print "Minutes are "TIME[2] 
  print "Time has "n" parts" 
}
