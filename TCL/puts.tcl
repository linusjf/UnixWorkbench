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

set distro Termux
puts "The Linux distribution name is $distro"

puts "The current working directory: [pwd]"
puts "2000000\b\b\b miles"

puts "0\t1"

set name Jane
puts \$name
puts \\$name

puts "He said: \"There are plenty of them\""
puts "There are currently many Linux\
distributions in the world"

set names(1) Jane
set names(2) Robert

puts $names(1)
puts $names(2)

puts [expr (1+3)*5]
