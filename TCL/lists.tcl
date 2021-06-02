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

set animals1 { lion eagle elephant dog cat }
set animals2 { giraffe tiger horse dolphin }

set animals [concat $animals1 $animals2]

puts $animals

puts [lsearch -exact $animals eagle]
puts [lreplace $animals 3 4 buffalo crocodile]

set names { John Mary Lenka Veronika Julia Robert }
set nums { 1 5 4 3 6 7 9 2 11 0 8 2 3 }

puts [lsort $names]
puts [lsort -ascii $names]
puts [lsort -ascii -decreasing $names]
puts [lsort -integer -increasing $nums]
puts [lsort -integer -decreasing $nums]
puts [lsort -integer -unique $nums]

set nums {1 2 {1 2 3 4} {{1 2} {3 4}} 3 4}

puts [llength $nums]
puts [llength [lindex $nums 2]]

puts [lindex $nums 0]
puts [lindex [lindex $nums 2] 1]
puts [lindex [lindex [lindex $nums 3] 1] 1]

set nums { 1 2 {1 2 3 {4 5}} 3 4 }

puts [lindex $nums 0]
puts [lindex $nums 2 1]
puts [lindex $nums 2 3 1]
