#!/usr/bin/env tclsh
set num 0

while { $num < 100 } {
    incr num
    if {$num % 2 == 0} { continue }
    puts -nonewline "$num "
}
puts ""
