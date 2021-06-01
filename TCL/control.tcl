#!/usr/bin/env tclsh
if yes {
    puts "This message is always shown"
}
if true then {
    puts "This message is always shown"
}
set sex female

if {$sex == "male"} {
    puts "It is a boy"
} else {
    puts "It is a girl"
}
