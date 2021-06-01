#!/usr/bin/env tclsh
puts [string match book???? bookcase] 

puts [regexp {[a-z]{3}} "abc"]
puts [regexp {^[a-z]{3}} "abc"]
puts [regexp {[^a-z]{3}} "abc"]
puts [regexp book(shelf|worm) bookworm] 
