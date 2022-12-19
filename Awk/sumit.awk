#!/usr/bin/env -S awk -f 
BEGIN { 
  if (ARGC == 2 ) 
  {
    n = ARGV[1] 
    # The sum of numbers 1...n is n(n+1)/2 
    sum = n * (n + 1) / 2 
    print "The sum of 1 to "n" is "sum 
  }
  if (ARGC == 3 ) { 
    m = ARGV[1] 
    n = ARGV[2] 
    if (m>n) { 
      print "First value must not be larger than second." 
      exit 2 
    }
    # The sum of numbers m...n is n(n+1)/2 - m(m-1)/2 
    sum_m = m * (m - 1) / 2 
    sum_n = n * (n + 1) / 2 
    sum = sum_n - sum_m 
    print "The sum of "m" to "n" is "sum 
  } 
  if (ARGC != 2 && ARGC !=3 ) { 
    print "Usage: sumit n " 
    print " returns sum of 1 - n" 
    print " sumit m n " 
    print " returns sum of m - n" 
    exit 1 
  } 
}
