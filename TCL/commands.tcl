#!/usr/bin/env tclsh

puts "This is Tcl tutorial"
puts stdout "This is Tcl tutorial"

puts [open messages w] "This is Tcl tutorial"

puts -nonewline "What is your name? "
flush stdout
gets stdin name
puts "Hello, $name"

set x 5

incr x  
puts $x

incr x 4
puts $x

puts [info tclversion]
puts [info host]
puts [info exists var]

set x 23
puts $x
puts [set x]

unset x
puts [info exists x]

puts "The script has $argc arguments"
puts "The list of arguments: $argv"
puts "The name of the script is $argv0"
