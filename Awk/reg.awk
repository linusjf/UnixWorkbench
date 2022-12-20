#!/usr/bin/env -S awk -f
/jump/ {print $1}
/[Jj]ump/ {print $1}
/^jump/ {print $1}
/jump$/ {print $1}
/j+/ {print $1}
/j*/ {print $1}


