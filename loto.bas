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
                
dim x as integer
dim y as integer
                
dim w as integer
dim h as integer
w=640                
h=480                
Randomize , 1
'' Create a graphics screen.
ScreenRes w, h, 32
line (0,0)-(w,h),rgb(255,255,255),bf
Dim images As Any Ptr = ImageCreate( w,h, RGB(255, 255, 255) )
dim s as string
s = "loto"
'Set the window title
WindowTitle s
                
                
                
                
                
                
                
                
                
line images,(0,0)-(w,h),rgb(255,255,255),bf
for y= 0 to h step 8
          line images,(0,y)-(w,y),rgb(0,0,255)
next y                
for x= 0 to w step 8
          line images,(x,0)-(x,h),rgb(0,0,255)
next x                
                
                
for y= 0 to 128 step 16
          s=str$(int(rnd*49)+1)
          Draw String images,(9,y+9), s,rgb(0,0,0)
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
                
Sleep                
cls                
