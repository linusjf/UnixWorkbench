#!/usr/bin/env -S awk -f
BEGIN { 
  sq=sprintf("%c",39) 
}  
{ 
  custid = $1
  old = $2 
  new = $3 
  printf("UPDATE TEMPLATES SET TEMPLATENAME = %c%s%c\n ",sq,new,sq) 
  printf("WHERE TEMPLATENAME like %c%s%c and custid = %c%s%c;\n", sq,old,sq,sq,custid,sq) 
}
