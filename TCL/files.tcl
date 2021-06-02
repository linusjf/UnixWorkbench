#!/usr/bin/env tclsh
puts [file volumes]
file mkdir newdir

set files [glob *]

foreach fl $files {
    if {[file isfile $fl]} {
        puts "$fl is a file"
    } elseif { [file isdirectory $fl]} {
        puts "$fl is a directory"
    }
}

set fp [open days w]

set days {Monday Tuesday Wednesday Thursday Friday Saturday Sunday}

puts $fp $days
close $fp
