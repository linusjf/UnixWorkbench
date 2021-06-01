#!/usr/bin/env tclsh
puts [expr +2]
puts [expr -2]
puts [expr -(-2)]
puts [expr 2+2]
puts [expr 2-2]
puts [expr 2*2]
puts [expr 2/2]
puts [expr 2/2.0]
puts [expr 2 % 2]
puts [expr 2 ** 2]

puts [expr 3/2]
puts [expr 3/2.0]

puts [set a 5]
puts [incr a]  
puts [incr a]
puts [incr a -1]

set x 3
set y 8

puts [expr $x == $y]
puts [expr $y > $x]

if {$y > $x} {

    puts "y is greater than x"
}

puts [expr 0 && 0]
puts [expr 0 && 1]
puts [expr 1 && 0]
puts [expr 1 && 1]

puts [expr 0 || 0]
puts [expr 0 || 1]
puts [expr 1 || 0]
puts [expr 1 || 1]

puts [expr ! 0]
puts [expr ! 1]
puts [expr ! (4<3)]

proc One {} {
    
    puts "Inside one"
    return false
}

proc Two {} {

    puts "Inside two"
    return true
}

puts "Short circuit"

if { [One] && [Two] } {

    puts "Pass"
}

puts "###################"

if { [Two] || [One] } {

    puts "Pass"
}
