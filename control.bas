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
                
type border
          x as integer
          y as integer
          w as integer
          h as integer
          b as integer
          size as integer
end type                
                
                
sub drawBorder(bb as border)
          dim b1 as ulong
          dim b2 as ulong
          dim b3 as ulong 
          dim b4 as ulong
                          
          if bb.b=0  or bb.b>2 then
                    b1=rgb(0,0,0)
                    b2=rgb(0,0,0)
                    b3=rgb(0,0,0)
                    b4=rgb(0,0,0)
          end if                
                          
          if bb.b=1 then
                    b1=rgb(0,0,0)
                    b2=rgb(255,255,255)
                    b3=rgb(255,255,255)
                    b4=rgb(0,0,0)
          end if                
                          
          if bb.b=2 then
                    b1=rgb(255,255,255)
                    b2=rgb(0,0,0)
                    b3=rgb(0,0,0)
                    b4=rgb(255,255,255)
          end if                
                          
          line(bb.x,bb.y)-(bb.x+bb.w,bb.y+bb.size),b1,bf
          line(bb.x+bb.w-bb.size,bb.y)-(bb.x+bb.w,bb.y+bb.h),b2,bf
          line(bb.x,bb.y+bb.h-bb.size)-(bb.x+bb.w,bb.y+bb.h),b3,bf
          line(bb.x,bb.y)-(bb.x+bb.size,bb.y+bb.h),b4,bf
end sub                
                
                
                
dim bor as border
dim x as integer
dim y as integer
                
dim w as integer
dim h as integer
w=640                
h=480                
                
'' Create a graphics screen.
ScreenRes w, h, 16
Dim images As Any Ptr = ImageCreate( w,h, RGB(255, 255, 255) )
dim s as string
s = "im love marina"
'Set the window title
WindowTitle s
cls                
beep                
                
                
                
                
                
                
                
                
                
line images,(0,0)-(w,h),rgb(255,255,255),bf
for y= 0 to h step 8
          line images,(0,y)-(w,y),rgb(0,0,255)
next y                
for x= 0 to w step 8
          line images,(x,0)-(x,h),rgb(0,0,255)
next x                
                
                
for y= 0 to h step 8
          Draw String images,(y, y), s,rgb(0,0,255)
next y                
                
                
                
Sound(523, 60)  'C5
put (0,0),images,pset
Sound(587, 60)  'D5
Sound(659, 60)  'E5
Sound(698, 60)  'F5
Sound(784, 60)  'G5
Sound(880, 60)  'A5
Sound(988, 60)  'B5
Sound(1046, 60) 'C6
                
bor.x=8                
bor.y=8                
bor.w=300
bor.h=50                
bor.b=0                
bor.size=1
                
drawborder bor
                
                
bor.x=8                
bor.y=100
bor.w=350
bor.h=50                
bor.b=0                
bor.size=4
                
drawborder bor
                
bor.x=8                
bor.y=200
bor.w=200
bor.h=25                
bor.b=1                
bor.size=1
                
drawborder bor
                
bor.x=8                
bor.y=300
bor.w=400
bor.h=25                
bor.b=2                
bor.size=0
                
drawborder bor
                
                
bor.x=8                
bor.y=400
bor.w=600
bor.h=40                
bor.b=2                
bor.size=1
                
drawborder bor
                
                
                
Sleep                
cls                
