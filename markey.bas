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




dim x as integer
dim y as integer

dim w as integer
dim h as integer
w=640
h=480

'' Create a graphics screen.
ScreenRes w, h, 32
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

line images,(0,480/2-20)-(640,480/2+20),rgb(255,255,255),bf





Sound(523, 60)  'C5

Sound(587, 60)  'D5
Sound(659, 60)  'E5
Sound(698, 60)  'F5
Sound(784, 60)  'G5
Sound(880, 60)  'A5
Sound(988, 60)  'B5
Sound(1046, 60) 'C6
x=640
do
ScreenSync
  ScreenLock
put (0,0),images,pset
Draw String (x,480/2), s,rgb(0,0,255)
ScreenUnlock

sleep 10
x=x-10
if x<(-len(s)*8)then x=640
if inkey$<>"" then exit do
loop
cls