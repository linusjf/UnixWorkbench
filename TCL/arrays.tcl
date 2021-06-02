#!/usr/bin/env tclsh

set names(1) Jane
set names(2) Tom
set names(3) Elisabeth
set names(4) Robert
set names(5) Julia
set names(6) Victoria

puts [array exists names]
puts [array size names]

puts $names(1)
puts $names(2)
puts $names(6)

array set days {
    1 Monday
    2 Tuesday
    3 Wednesday
    4 Thursday
    5 Friday
    6 Saturday
    7 Sunday
}

set n [array size days]

puts $days(1)
puts "array has $n elements"

upvar #0 days(1) mon
upvar #0 days(2) tue
upvar #0 days(3) wed

puts $mon
puts $tue
puts $wed

array set day {
    Peter 34
    Jane 17
    Lucy 28
    Mark 43
    Anthony 36
}

puts [array get day]

array set weekdays {
    1 Monday
    2 Tuesday
    3 Wednesday
    4 Thursday
    5 Friday
    6 Saturday
    7 Sunday
}

foreach {n dow} [array get weekdays] {
    puts "$n -> $dow"
}

array set nums { a 1 b 2 c 3 d 4 e 5 }

puts [array names nums]

foreach n [array names nums] {
    puts $nums($n)
}
