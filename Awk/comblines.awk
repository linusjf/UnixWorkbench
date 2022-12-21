#!/usr/bin/env -S awk -f
/Name/ {  
  if (d)
    print d  
  d = ""  
}  
{ 
  d = d" "$0
}  
END { 
  print d
}
