#!/usr/bin/env tclsh
set secs [clock seconds]

puts "Short date: [clock format $secs -format %D]"
puts "Long date: [clock format $secs -format "%A, %B %d, %Y"]"
puts "Short time: [clock format $secs -format %R]"
puts "Long time: [clock format $secs -format %r]"
puts "Month: [clock format $secs -format %B]"
puts "Year: [clock format $secs -format %Y]"
