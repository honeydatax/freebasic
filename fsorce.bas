#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"

dim shared kernelseg as integer
dim shared kerneloffs as long



dim shared seg as integer
dim shared offset as integer

sub getfont()
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
r1.h.al=&h30
r1.h.bh=2



__dpmi_int(sd,@r1)

seg=r1.x.es
offset=r1.x.bp

end sub


sub setfont()
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
r1.h.bh=14
r1.x.cx=255
r1.x.es=seg
r1.x.bp=offset


__dpmi_int(sd,@r1)



end sub
 
 
dim i as long
dim a as integer

color 1,15
cls 


for  a=0 to 255
if a>6 and a<16 then
print " ";
else
print chr$(a);
end if
next a
 
 








getfont



setfont


end
