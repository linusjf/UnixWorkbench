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

puts [expr ~7] 
puts [expr ~-8]
puts [expr 6 & 3]
puts [expr 3 & 6]
puts [expr 6 | 3]
puts [expr 3 | 6]

puts [expr 6 | 3]
puts [expr 3 | 6]

puts [expr 6 ^ 3]
puts [expr 3 ^ 6]

puts [expr 3 + 5 * 5]
puts [expr (3 + 5) * 5]

puts [expr ! 1 || 1]
puts [expr ! (1 || 1)] 

set age 32
set adult [expr $age >= 18 ? true : false]

puts "Adult: $adult"

set nums {1 2 3 4 5 6}
puts $nums
puts [tcl::mathfunc::max {*}$nums]
puts [tcl::mathfunc::min {*}$nums]
