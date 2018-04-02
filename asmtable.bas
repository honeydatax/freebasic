const pi as double=3.1415927
dim a as string
dim b as string
dim m as double
dim n as double
dim o as integer
dim p as integer
dim l as long
                
                
open "table.asm" for output as 1
print #1,"cos: "
p=0                
for n=0 to 360
          if p=0 then print #1,"db ";
          m=10000*cos(n/180*pi)
          l=m                
          print  #1,l;
                          
          if p<>9 then print #1,",";
          if p=9 then print #1," "
          p=p+1                
          if p>9 then p=0
                          
next n                
                
print #1,"0"
print #1," "
print #1," "
print #1,"sin: "
p=0                
for n=0 to 360
          if p=0 then print #1,"db ";
          m=10000*sin(n/180*pi)
          l=m                
          print  #1,l;
                          
          if p<>9 then print #1,",",
          if p=9 then print #1," "
          p=p+1                
          if p>9 then p=0
                          
next n                
                
print #1,"0"
print #1," "
print #1," "
                
close #1                
                
