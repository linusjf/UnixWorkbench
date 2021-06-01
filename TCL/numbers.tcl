#!/usr/bin/env tclsh

puts [format "%-10s %-14s %s" Decimal Hexadecimal Octal]

puts [format "%-10d %-14x %o" 5000 5000 5000]
puts [format "%-10d %-14x %o" 344 344 344]
puts [format "%-10d %-14x %o" 55 55 55]
puts [format "%-10d %-14x %o" 9 9 9]
puts [format "%-10d %-14x %o" 15666 15666 15666]
