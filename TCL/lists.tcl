#!/usr/bin/env tclsh

set l1 { 1 2 3 }
set l2 [list one two three]
set l3 [split "1.2.3.4" .]

puts $l1
puts $l2
puts $l3

puts [llength { 1 2 3 4 }]
puts [llength {}]
puts [llength { 1 2 {3 4} }]
puts [llength { 1 2 {} 3 4 }]

set vals { 2 4 6 8 10 12 14 }

puts [lindex $vals 0]
puts [lindex $vals 3]
puts [lindex $vals end]
puts [lindex $vals end-2]

puts [lrange { a b c d e } 2 4]
puts [lrange { a b c d e } 1 end]

lassign { a b c } x y z
puts "$x $y $z"

foreach item {1 2 3 4 5 6 7 8 9} {
    puts -nonewline "$item "
}
puts ""

set days [list Monday Tuesday Wednesday Thursday \
    Friday Saturday Sunday]
set n [llength $days]

set i 0
while {$i < $n} {
    puts [lindex $days $i]
    incr i
}
set vals { 1 2 3 4 5 6 }
puts [lmap a $vals {expr {$a ** 2}}]

set nums {4 5 6}
puts $nums

lappend nums 7 8 9
puts $nums

puts [linsert $nums 0 1 2 3]
puts $nums
