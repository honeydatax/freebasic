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
                
type grid
          x as integer
          y as integer
          w as integer
          h as integer
          c as ulong
          size as integer
end type                
                
                
sub drawGrid(g as grid)
          dim x as integer
          dim y as integer
          view (g.x,g.y)-(g.x+g.w,g.y+g.h)
          for y= 0 to g.h step g.size
                    line (0,y)-(g.w,y),g.c
          next y                
          for x= 0 to g.w step g.size
                    line (x,0)-(x,g.h),g.c
          next x                
          view (0,0)-(639,479)
end sub                
                
dim x as integer
dim y as integer
dim g1 as grid
dim g2 as grid
dim g3 as grid
dim g4 as grid
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
                
                
                
                
                
                
                
                
                
line (0,0)-(w,h),rgb(255,255,255),bf
                
g2.x=320                
g2.y=240                
g2.w=320                
g2.h=240                
g2.c=rgb(0,0,0)
g2.size=32
                
                
g1.x=0                
g1.y=0                
g1.w=320                
g1.h=240                
g1.c=rgb(0,0,255)
g1.size=12
                
g3.x=0                
g3.y=240                
g3.w=320                
g3.h=240                
g3.c=rgb(128,128,128)
g3.size=20
                
g4.x=320                
g4.y=0                
g4.w=320                
g4.h=240                
g4.c=rgb(0,128,128)
g4.size=50
                
                
drawGrid(g1)
                
drawGrid(g2)
                
drawGrid(g3)
                
drawGrid(g4)
                
                
for y= 0 to h step 8
          Draw String (y, y), s,rgb(0,0,255)
next y                
                
                
                
Sound(523, 60)  'C5
Sound(587, 60)  'D5
Sound(659, 60)  'E5
Sound(698, 60)  'F5
Sound(784, 60)  'G5
Sound(880, 60)  'A5
Sound(988, 60)  'B5
Sound(1046, 60) 'C6
                
Sleep                
cls                
