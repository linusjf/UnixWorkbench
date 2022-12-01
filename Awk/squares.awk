#!/usr/bin/env -S awk -f  
BEGIN {  
  if (ARGC < 2)  {  
    printf ("Usage: %s file\n",ARGV[0])  
    exit 1  
  }  
  while ( "sort -n "ARGV[1] | getline)
    printf ("The square of %d is: %d\n", $1, $1 ^ 2 )  
}
