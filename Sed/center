#!/usr/bin/env -S sed -E -f

# Put 40 spaces in the buffer
1 {
  x
  s/^$/     /
  s/^.*$/&&&&&&&&/
  x
}

# delete leading and trailing spaces
y/  /  /
s/^ *//
s/ *$//

# add a newline and 80 spaces to end of line
G

# keep first 41 chars (40 + a newline)
s/^(.{41}).*$/\1/

# \2 matches half of the spaces, which are moved to the beginning
#s/^(.*)\n(.*)\2/\2\1/
s/^(.+)\n(.+)\2/\2\1/
