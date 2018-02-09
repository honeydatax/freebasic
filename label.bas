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



type button
x as integer
y as integer
w as integer
h as integer
s as string
end type


sub drawButton(b as button)
view (b.x,b.y)-(b.x+b.w,b.y+b.h)
line (0,0)-(b.w,b.h),rgb(127,127,127),bf
line (0,0)-(b.w,b.h),rgb(0,0,0),b
draw string (b.w/2-len(b.s)*8/2,b.h/2-4),b.s,rgb(0,0,0)
  View (0,0)-(639,479)
end sub


function getTexth (s as string)as integer
return 10
end function


function getTextw (s as string)as integer
return 8*len(s)
end function


function onarea(x as integer,y as integer,w as integer,h as integer)as boolean
dim xx as integer
dim yy as integer
dim bb as integer
dim rr as integer
rr=false
getmouse xx,yy,,bb
if bb <> 0 then
if xx>x and xx< x+w and yy > y and yy < y+h then rr=true
end if
return rr
end function


function onButtonArea(b as button)as boolean
return onarea(b.x,b.y,b.w,b.h)

end function

#include "vbcompat.bi"
dim bb as button
dim x as integer
dim y as integer
Dim a As Double, b As Double
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

bb.x =8
bb.y=460
bb.s=s
bb.w=getTextw(bb.s)
bb.h=getTexth(bb.s)*2


Sound(523, 60)  'C5
put (0,0),images,pset
drawButton bb
Sound(587, 60)  'D5
Sound(659, 60)  'E5
Sound(698, 60)  'F5
Sound(784, 60)  'G5
Sound(880, 60)  'A5
Sound(988, 60)  'B5
Sound(1046, 60) 'C6

do

a = Now
s=str$(Hour(a))+":"+str$(minute(a))+":"+str$(second(a))
bb.s=s
drawButton bb
sleep 1000
if inkey$<>"" then exit do
loop
cls