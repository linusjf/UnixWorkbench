#!/usr/bin/env tclsh
puts -nonewline "Select a top level domain name:"
flush stdout

gets stdin domain

switch $domain {
    us { puts "United States" }
    de { puts Germany }
    sk { puts Slovakia }
    hu { puts Hungary }
    default { puts "unknown" }
}
