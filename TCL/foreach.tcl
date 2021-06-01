#!/usr/bin/env tclsh

set planets { Mercury Venus Earth Mars Jupiter Saturn
    Uranus Neptune }

foreach planet $planets {
    puts $planet
}

set actresses { Rachel Weiss Scarlett Johansson Jessica Alba \
    Marion Cotillard Jennifer Connelly}

foreach {first second} $actresses {
    puts "$first $second"
}

foreach i { one two three } item {car coins rocks} {
    puts "$i $item"
}
