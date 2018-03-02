#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"

dim shared kernelseg as integer
dim shared kerneloffs as long

Dim shared buffer(12*8) As UByte

dim shared mem as long

sub alocatemem()
dim r1 as  __dpmi_regs




dim sd as integer=&h21
dim sb as integer
dim a as long
dim b as long
dim c as byte
dim d as integer
dim e as long
dim df as __dpmi_raddr





sd=&h21

r1.h.ah=&h48
r1.x.bx=8*12/16



__dpmi_int(sd,@r1)

mem=r1.x.ax
mem= mem shl 4

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
r1.h.bh=12
r1.x.cx=6
r1.x.es=(mem shr 4)
r1.x.bp=0


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
 
 



alocatemem





i = @buffer(0)
Poke i,      &b11111111
Poke i+1,  &b10100101
Poke i+2,  &b10100101
Poke i+3,  &b11111111
Poke i+4,  &b10100101
Poke i+5,  &b10100101
Poke i+6,  &b11111111
Poke i+7,  &b10100101
Poke i+8,  &b10100101
Poke i+9,  &b11111111
Poke i+10,&b10100101
Poke i+11,&b10100101
i = i+12

Poke i,       &b00000000
Poke i+1,  &b00011000
Poke i+2,  &b00011000
Poke i+3,  &b11111111
Poke i+4,  &b00011000
Poke i+5,  &b00011000
Poke i+6,  &b00100100
Poke i+7,  &b10100100
Poke i+8,  &b01000010
Poke i+9,  &b10000001
Poke i+10,&b10000001
Poke i+11,&b00000000

i = i+12

Poke i,       &b00000000
Poke i+1,  &b00011000
Poke i+2,  &b00111100
Poke i+3,  &b01111110
Poke i+4,  &b11111111
Poke i+5,  &b11111111
Poke i+6,  &b01111110
Poke i+7,  &b00111100
Poke i+8,  &b00011000
Poke i+9,  &b00000000
Poke i+10,&b00000000
Poke i+11,&b00000000

i = i+12

Poke i,       &b00000000
Poke i+1,  &b00010000
Poke i+2,  &b10010001
Poke i+3,  &b11111111
Poke i+4,  &b00000000
Poke i+5,  &b00000000
Poke i+6,  &b00000000
Poke i+7,  &b00000000
Poke i+8,  &b00000000
Poke i+9,  &b00000000
Poke i+10,&b00000000
Poke i+11,&b00000000


i = i+12

Poke i,       &b00011000
Poke i+1,  &b00111100
Poke i+2,  &b01111110
Poke i+3,  &b11111111
Poke i+4,  &b00011000
Poke i+5,  &b00011000
Poke i+6,  &b00011000
Poke i+7,  &b00011000
Poke i+8,  &b00011000
Poke i+9,  &b00011000
Poke i+10,&b00011000
Poke i+11,&b00011000

i = i+12

Poke i,       &b11111111
Poke i+1,  &b10000001
Poke i+2,  &b10000001
Poke i+3,  &b10000001
Poke i+4,  &b10000001
Poke i+5,  &b10000001
Poke i+6,  &b10011001
Poke i+7,  &b10000001
Poke i+8,  &b10000001
Poke i+9,  &b10000001
Poke i+10,&b10000001
Poke i+11,&b11111111




	dosmemput @buffer(0),12*6, mem



setfont


end
