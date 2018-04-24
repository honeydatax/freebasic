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
dim b as integer
dim xx as integer
dim yy as integer
dim ab as integer
dim o as integer
dim k as string
dim bt as integer
                
dim w as integer
dim h as integer
w=640                
h=480                
                
'' Create a graphics screen.
ScreenRes w, h, 4
                
dim s as string
'Set the window title
cls                
beep                
                
                
                
                
                
                
                
                
                
line (0,0)-(w,h),15,bf
for y= 0 to h step h\8
          line (0,y)-(w,y),1
next y                
for x= 0 to w step w\8
          line (x,0)-(x,h),1
next x                
                
                
                
do                
          k= inkey()
          if k=chr(27) then exit do
          ab=getmouse(x,y,,bt)
          if bt=1 then
                    xx=x\(w\8)
                    yy=y\(h\8)
                    o=xx*50+yy*50*8+200
                    Sound(o, 60)
          end if                
loop                
                
                
                
                
                
                
                
                
cls                
