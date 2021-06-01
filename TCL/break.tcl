#!/usr/bin/env tclsh

while true {
    set r [expr 1 + round(rand()*30)]
    puts -nonewline "$r "
    if {$r == 22} { break }
}

puts ""
