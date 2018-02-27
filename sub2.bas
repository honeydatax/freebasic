


#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"

dim shared kernelseg as integer
dim shared kerneloffs as long

dim shared wax as long
dim shared wbx as long
dim shared wcx as long
dim shared wdx as long
dim shared wsi as long
dim shared wdi as long
dim shared wes as integer


sub intf0()

asm

mov [wax],eax
mov [wbx],ebx
mov [wcx],ecx
mov [wdx],edx
mov [wsi],esi
mov [wdi],edi
mov ax,es
mov [wes],ax
end asm

print "eax:"; hex(wax)
print "ebx:"; hex(wbx)
print "ecx:"; hex(wcx)
print "edx:"; hex(wdx)
print "esi:"; hex(wsi)
print "edi:"; hex(wdi)
print " es:";hex(wes)



print "call sub "


end sub


sub callfarm(func as long , par1 as long, par2 as long ,par3 as long,par4 as long)
asm 
mov ebx,[func]
mov ecx,[par1]
mov edx,[par2]
mov esi,[par3]
mov edi,[par4]
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


callfarm(0,1,2,3,4)

print "end"

end

