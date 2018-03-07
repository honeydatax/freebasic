                
                
                
#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"
                
dim shared kernelseg as integer
dim shared kerneloffs as long
                
                
                
                
                
                
                
sub setfont(fun as byte)
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
          r1.h.al=fun
                          
                          
          __dpmi_int(sd,@r1)
                          
                          
end sub                
                
                
                
                
                
                
                
                
print "im love marina"
                
                
setfont 1
sleep                 
                
setfont 2
sleep                 
                
                
                
setfont 4
sleep                 
                
                
                
end                
                
