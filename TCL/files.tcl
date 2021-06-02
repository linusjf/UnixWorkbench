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

set fp [open languages r]
set data [read $fp]
puts -nonewline $data
close $fp

set fp [open languages]
while {![eof $fp]} {
    puts [gets $fp]
}
close $fp

set fp [open newfile w]

puts $fp "this is new file"
flush $fp
file copy newfile newfile2
file delete newfile
close $fp
