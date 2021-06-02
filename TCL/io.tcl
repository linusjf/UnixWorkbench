#!/usr/bin/env tclsh
puts "Message 1"
puts stdout "Message 2"
puts stderr "Message 3"

set c [read stdin 1]

while {$c != "q"} {
    puts -nonewline "$c"
    set c [read stdin 1]
}
