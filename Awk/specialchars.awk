#!/usr/bin/env -S awk -f
{
  c="@";
  if (index($0,c)) 
    print NR": "$0
  c="®";
  if (index($0,c)) 
    print NR": "$0
}
