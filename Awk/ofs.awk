#!/usr/bin/env -S awk -f
{ 
print $1,$2,$3 
OFS="%" 
print $1,$2,$3 
print $0 
}
