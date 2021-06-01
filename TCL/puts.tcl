#!/usr/bin/env tclsh

puts zetcode.com; puts androida.co

puts zetcode
puts androida

puts [expr 1+2]

set name Jane

puts name
puts $name

puts "This is \t Sparta"

puts "This was a \"great\" experience"
puts "The \\ character is the backslash character"

puts "20000\b\b miles"

set age        32
set name       Robert
set occupation programmer

puts $name
puts $age
puts $occupation

set vals { 1 2 3 4 5 6 7 }
puts $vals

set name Jane
set Name Julia
set NAME Erika

puts $name
puts $Name
puts $NAME

set name {Julia Novak}
puts $name

puts "Her name is $name"
puts {Her name is $name}

set numbers { 1 2 3 4 5 6 7 }
puts $numbers

puts "Braces {} are reserved characters in Tcl"
puts {Braces {} are reserved characters in Tcl}

set cwd [pwd]
puts $cwd

puts [clock format [clock seconds] -format "%Y-%m-%d %T"]
