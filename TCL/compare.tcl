#!/usr/bin/env tclsh

puts [string compare 12 12]
puts [string compare Eagle Eagle]
puts [string compare Eagle eagle]
puts [string compare -nocase Eagle eagle]

set str1 Tcl
set str2 "Tcl language"

puts [string compare $str1 $str2]
puts [string compare -length 3 $str1 $str2]

puts [string equal $str1 $str2]
puts [string equal -length 3 $str1 $str2]
