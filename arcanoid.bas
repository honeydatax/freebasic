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
dim x1 as integer
dim xx as integer
dim yy as integer
dim y1 as integer
dim b1 as integer
x1=640\2-15
dim bb as integer
dim b as integer

dim w as integer
dim h as integer
w=640
h=480

'' Create a graphics screen.
ScreenRes w, h, 32

Dim images As Any Ptr = ImageCreate( w,h, RGB(255, 255, 255) )
Dim image As Any Ptr = ImageCreate( w,h, RGB(255, 255, 255) )
dim s as string
s = "im love marina"
'Set the window title
WindowTitle s
cls










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

s=inkey
SetMouse x1,430
x=50
y=50
xx=6
yy=6
bb=25
do
put image,(0,0),images,pset
circle image,(x,y),bb,rgb(0,50,128),,,1.0,f
GetMouse(x1,y1,,b1)
line image,(x1,430)-(x1+30,450),rgb(0,50,128),bf
put (0,0),image,pset
Sleep 1
x=x+xx
y=y+yy
if x>(w-bb) then 
xx=-6
Sound(523, 60)  'C5
end if 
if x<(bb)then 
xx=6
Sound(523, 60)  'C5
end if 
if y>(430-bb) then 
if x>x1- 5 and x<x1+35 then
yy=-6
Sound(523, 60)  'C5
else 
exit do
end if
end if 
if y<bb then 
yy=6
Sound(523, 60)  'C5
end if
s=inkey
if s <> "" Then 
exit do
end if

loop 

exitgame:

sleep
cls