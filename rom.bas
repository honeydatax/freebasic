#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"

dim shared kernelseg as integer
dim shared kerneloffs as long







sub setfont()
dim r1 as  __dpmi_regs
dim r2 as  __dpmi_regs
dim r3 as  __dpmi_regs



dim sd as integer=&h21
dim sb as integer
dim a as long
dim b as long
dim c as byte
dim d as integer
dim e as long
dim df as __dpmi_raddr

sd=&h10

r2.h.ah=&h11
r2.h.al=&h30
r2.h.bh=0




__dpmi_int(sd,@r2)


print 
print "sector:";hex$(r2.x.es)
print "offset:";hex$(r2.x.bp)
print

sd=&h10

r1.h.ah=&h11
r1.h.al=0
r1.x.dx=0
r1.h.bl=0
r1.h.bh=8
r1.x.cx=256
r1.x.es=r2.x.es
r1.x.bp=r2.x.bp


__dpmi_int(sd,@r1)



end sub
 
 

dim a as integer



for  a=0 to 255
if a=7 or a=8 or a=10 or a=13 then
print " ";
else
print chr$(a);
end if
next a
 
setfont 








end

