


#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"

dim shared kernelseg as integer
dim shared kerneloffs as long







sub setfont(fun as integer,p1 as integer)
dim r1 as  __dpmi_regs

dim sd as integer=&h21
dim sb as integer
dim a as long
dim b as long
dim c as byte
dim d as integer
dim e as long
dim df as __dpmi_raddr

sd=&h10

r1.h.ah=&h11
r1.h.al=0
r1.x.dx=0
r1.h.bl=0
r1.h.bh=12
r1.x.cx=256
r1.x.es=fun
r1.x.bp=p1


__dpmi_int(sd,@r1)


end sub
 
 






print "im love marina"

 
setfont &h0,&h0
sleep 







end

