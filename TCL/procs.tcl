#!/usr/bin/env tclsh

proc tclver {} {
    set v [info tclversion]
    puts "This is Tcl version $v"
}

tclver

proc ftc {f} {
    return [expr $f * 9 / 5 + 32]
}

puts [ftc 100]
puts [ftc 0]
puts [ftc 30]

proc maximum {x y} {
    if {$x > $y} {
        return $x
    } else {
        return $y
    }
}

set a 23
set b 32

set val [maximum $a $b]
puts "The max of $a, $b is $val"

proc sum {args} {
    set s 0
    foreach arg $args {
        incr s $arg
    }
    return $s
}

puts [sum 1 2 3 4]
puts [sum 1 2]
puts [sum 4]

proc power {a {b 2}} {
    if {$b == 2} {
        return [expr $a * $a]
    }
    set value 1
    for {set i 0} {$i<$b} {incr i} {
        set value [expr $value * $a]
    }
    return $value
}

set v1 [power 5]
set v2 [power 5 4]
set v3 [power 5 0]

puts "5^2 is $v1"
puts "5^4 is $v2"
puts "5^0 is $v3"

proc tworandoms {} {
    set r1 [expr round(rand()*10)]
    set r2 [expr round(rand()*10)]
    return [list $r1 $r2]
}

puts [tworandoms]
puts [tworandoms]
puts [tworandoms]
puts [tworandoms]

proc factorial n {
    if {$n==0} {
        return 1
    } else {
        return [expr $n * [factorial [expr $n - 1]]]
    }
}

# Stack limit between 800 and 1000 levels
puts [factorial 4]
puts [factorial 10]
puts [factorial 18]

proc inside {} {
    puts "inside procedure"
    set x 4
    puts "x is $x"
}

set x 1

puts "outside procedure"
puts "x is $x"

inside

puts "outside procedure"
puts "x is $x"

proc insight {} {
    upvar x y
    puts "inside procedure"
    puts "y is $y"
    set y 4
    puts "y is $y"
}

set x 1

puts "outside procedure"
puts "x is $x"

insight

puts "outside procedure"
puts "x is $x"

proc test {} {

    global x 
    puts "inside test procedure x is $x"

    proc nested {} {
        global x
        puts "inside nested x is $x"
    }
}

set x 1

test
nested

puts "outside x is $x"
