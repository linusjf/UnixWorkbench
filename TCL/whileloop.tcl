#!/usr/bin/env tclsh
# whileloop.tcl

set i 0
set sum 0

while { $i < 10 } {
    incr i
    incr sum $i
}

puts $sum
