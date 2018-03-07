#include "dos/dpmi.bi"
#include "dos/go32.bi"
#include "dos/sys/farptr.bi"
                
dim shared kernelseg as integer
dim shared kerneloffs as long
                
Dim shared buffer(12*8) As UByte
                
dim shared mem as long
                
                
Sub Sound(ByVal freq As UInteger, dur As UInteger)
          Dim t As Double,f1 As Unsigned Short
          f1 = 1193181 \ freq
          Out &h61,Inp(&h61) Or 3
          Out &h43,&hb6
          Out &h42,LoByte(f1)
          Out &h42,HiByte(f1)
          t=Timer                 
          While ((Timer - t) * 1000) < dur
          Sleep 0,1
          Wend                
          Out &h61,Inp(&h61) And &hfc
End Sub                
                
                
                
                
                
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
                
                
                
                
                
sub preparing()
                          
                          
          dim i as long
          dim a as integer
                          
                          
                          
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
                          
          color 1,15
          cls                 
          locate 1,1
                          
          for  a=0 to 80*24-1
                    print chr$(0);
          next a                
                          
          locate 25,1
          print " 1 up | 2 down | 3 left  | 4 rigth | esc exit |";
                          
end sub                
                
randomize,1
dim x1 as integer
dim xx(0 to 10) as integer
dim yy(0 to 10) as integer
dim a as string=""
dim x as integer=1
dim y as integer=1
dim b as string =chr$(1)
dim bb as string =chr$(0)
dim score as integer=0
preparing
                
for x=0 to 10
          xx(x)=int(rnd*78)+1
          yy(x)=int(rnd*22)+2
next x                
                
for x=0 to 10
          locate yy(x),xx(x)
          print chr$(2);
next x                
                
                
x=1                
                
                
do                
          locate y,x
          print bb 
          if a="1" then y=y-1
          if a="2" then y=y+1
          if a="3" then x=x-1
          if a="4" then x=x+1
          if x> 79 then x=79
          if y> 24 then y=24
          if x<1 then x=1
          if y<1 then y=1
          for x1=0 to 10
                    if yy(x1)= y and xx(x1)=x then
                              yy(x1)=1000
                              xx(x1)=1000
                              score=score+100
                              Sound(523, 60)  'C5
                              Sound(587, 60)  'D5
                              Sound(659, 60)  'E5
                              Sound(698, 60)  'F5
                              Sound(784, 60)  'G5
                              Sound(880, 60)  'A5
                              Sound(988, 60)  'B5
                              Sound(1046, 60) 'C6
                                              
                                              
                    end if                
          next x1                
          locate 25,50
          print "pt:" ;score;"                 ";
          locate y,x
          print b                 
          locate y,x
          sleep                
          a=inkey$()
loop until a=chr$(27)
                
                
cls                
                
end                
