#!/usr/bin/tclsh
# nums.tcl
puts -nonewline "Enter a number: "
flush stdout
set a [gets stdin]

if {$a < 0} {
    puts "the number is negative"
} elseif { $a == 0 } {
    puts "the number is zero"
} else {
    puts "the number is positive"
}
