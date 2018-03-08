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
                
                
                
                
ScreenRes 640, 480, 16
                
                
dim x as integer
dim y as integer
                
dim w as integer
dim h as integer
w=640                
h=480                
                
Dim pal(0 To 256-1) As Integer
cls                
Dim myImage As Any Ptr = ImageCreate(640, 480,rgb(255,255,255))
line (0,0)-(640,480),rgb(255,255,255),bf
for y= 0 to h step 8
          line myimage,(0,y)-(w,y),rgb(0,0,255)
next y                
for x= 0 to w step 8
          line myimage,(x,0)-(x,h),rgb(0,0,255)
next x                
BLoad "marina.bmp",myimage,@pal(0)
Palette Using pal(0)
                
Put (0,0), myImage,pset
ImageDestroy( myImage )
                
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
