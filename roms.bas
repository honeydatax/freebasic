#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"


dim shared seg as integer



screen 12

color 1,15
cls
dim a as integer
dim b as integer
dim c as integer

locate 1,1

print "char rom  table"
print
print "  0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F"
for b= 0 to 15
print hex$(b);"|";
for  a=0 to 15
c=b*16+a
if c>6 and c<16 then
print " ";"|";
else
print chr$(c);"|";
end if
next a
print hex$(b)
next b
print "  0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F"

print

sleep


end

