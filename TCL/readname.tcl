#!/usr/bin/env tclsh
puts -nonewline "Enter your name: "
flush stdout
set name [gets stdin]
puts "Hello, $name"
