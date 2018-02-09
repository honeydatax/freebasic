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
Dim ip As Any Ptr
Dim As Integer x, y,w,h
dim c as byte





ScreenSync
  ScreenLock
  View (0,0)-(639,479)
line (0,0)-(640,480),rgb(255,255,255),bf
c=32
For y = 1to 300 step 25

View (y-1,y-1)-(102+y,102+y)
Line (0,0)-(102,102), rgb(0,0,0) ,b
View (y,y)-(100+y,100+y)
Line (0,0)-(100,100), rgb(c,c,c), bf
c=c+16
Next y

ScreenUnlock

Sound(523, 60)  'C5
Sound(587, 60)  'D5
Sound(659, 60)  'E5
Sound(698, 60)  'F5
Sound(784, 60)  'G5
Sound(880, 60)  'A5
Sound(988, 60)  'B5
Sound(1046, 60) 'C6

Do


Loop While Inkey = ""

