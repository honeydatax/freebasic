


#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"

dim shared kernelseg as integer
dim shared kerneloffs as long

sub intf0()




print "call sub "

end sub


sub callfarm()
asm 
mov ax,[kernelseg]
mov es,ax
mov eax,[kerneloffs]
es:
call eax
end asm
end sub




sub setkernel(intf0s as long)
dim r1 as  __dpmi_regs
dim ad as __dpmi_paddr
dim sd as integer=&h21
dim sb as integer
dim a as long
dim b as long
dim c as byte
dim d as integer
dim e as long
dim df as __dpmi_raddr

sd=&h21
 r1.x.ds=_go32_my_cs()
 r1.x.dx=0
r1.h.ah=&h25
r1.h.al=&hef


__dpmi_int(sd,@r1)


 sd=&h21
 r1.x.ds=hiword(intf0s)
 r1.x.dx=loword(intf0s)
r1.h.ah=&h25
r1.h.al=&hf0


__dpmi_int(sd,@r1)
end sub
 
 
 sub getkernel()
dim r1 as  __dpmi_regs
dim ad as __dpmi_paddr
dim sd as integer=&h21
dim sb as integer
dim a as long
dim b as long
dim c as byte
dim d as integer
dim e as long
dim df as __dpmi_raddr

sd=&h21

r1.h.ah=&h35
r1.h.al=&hef


__dpmi_int(sd,@r1)

kernelseg= r1.x.es


 sd=&h21

r1.h.ah=&h35
r1.h.al=&hf0


 
__dpmi_int(sd,@r1)
 kerneloffs=r1.x.es shl 16
kerneloffs= kerneloffs +r1.x.bx
end sub
 
 

Dim buffer(64) As UByte

dim r1 as  __dpmi_regs
dim ad as __dpmi_paddr
dim sd as integer=&h21
dim sb as integer
dim a as long
dim b as long
dim c as byte
dim d as integer
dim e as long
dim df as __dpmi_raddr






 
setkernel @intf0()
getkernel
print hex(_go32_my_cs() )
print hex(kernelseg)

print hex(@intf0() )
print hex(kerneloffs)

if kernelseg=_go32_my_cs() then print "segment ok"
if kerneloffs=@intf0() then print "offset ok"


callfarm()

print "end"

end

