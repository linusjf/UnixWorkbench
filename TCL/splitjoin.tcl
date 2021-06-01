#!/usr/bin/env tclsh
set langs "Tcl,Java,C,C#,Ruby,Falcon"
puts [split $langs ,]
puts [join [split $langs ","] ":"]
