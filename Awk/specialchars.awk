#!/usr/bin/env -S awk -f
{
  c="@";
  if (index($0,c)) 
    print $0
  c="®";
  if (index($0,c)) 
    print $0
}
