#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"


dim shared seg as integer



dim a as integer


print "char rom  table"
print

for  a=0 to 255
if a=7 or a=8 or a=10 or a=13 then
print " ";
else
print chr$(a);
end if
next a
 
 

print




end

