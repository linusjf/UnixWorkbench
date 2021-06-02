#!/usr/bin/env tclsh
set files [glob *.tcl]
foreach file $files {
    puts -nonewline "$file "
}
puts ""

