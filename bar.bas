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


type percent
x as integer
y as integer
w as integer
h as integer
p as integer
end type




sub drawButton(b as button)
view (b.x,b.y)-(b.x+b.w,b.y+b.h)
line (0,0)-(b.w,b.h),rgb(127,127,127),bf
line (0,0)-(b.w,b.h),rgb(0,0,0),b
draw string (b.w/2-len(b.s)*8/2,b.h/2-4),b.s,rgb(0,0,0)
  View (0,0)-(639,479)
end sub

sub drawPercent(b as percent)
dim s as string 
dim d as double
dim d2 as double
dim w as integer
d=b.p
d2=b.w
d2=d2/100.00
d=d*d2
s=str$(b.p)+"%"
w=d
ScreenSync
  ScreenLock
view (b.x,b.y)-(b.x+b.w,b.y+b.h)
line (0,0)-(b.w,b.h),rgb(255,255,255),bf
line (0,0)-(w,b.h),rgb(0,0,255),bf
line (0,0)-(b.w,b.h),rgb(0,0,0),b
draw string (b.w/2-len(s)*8/2,b.h/2-4),s,rgb(0,0,0)
  View (0,0)-(639,479)
  ScreenUnlock
end sub

sub drawBar(b as percent)
dim s as string 
dim d as double
dim d2 as double
dim d3 as double
dim d4 as double
dim w as integer
dim ww as integer
dim www as integer
dim www2 as integer
dim m as integer
dim d5 as double
d5=b.h
d5=d5*0.9
www2=d5
d=b.p
d2=b.w
d2=d2/100.00
d=d*d2
d3=b.w
d3=d3/10.00
ww=d3
s=str$(b.p)+"%"
w=d
ScreenSync
  ScreenLock
view (b.x,b.y)-(b.x+b.w,b.y+b.h)
line (0,0)-(b.w,b.h),rgb(255,255,255),bf
line (0,0+www2)-(w,b.h-www2),rgb(0,0,255),bf
for m=0 to 5
www=m*(ww*2)
line (www,0)-(www+ww,b.h),rgb(255,255,255),bf
next m
line (0,0)-(b.w,b.h),rgb(0,0,0),b
draw string (b.w/2-len(s)*8/2,b.h/2-4),s,rgb(0,0,0)
  View (0,0)-(639,479)
  ScreenUnlock
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

dim bb2 as percent
dim bb3 as percent
dim bb4 as percent
dim bb as percent
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

bb.x =8
bb.y=8
bb.w=200
bb.h=9*4
bb.p=0


bb2.x =8
bb2.y=100
bb2.w=300
bb2.h=9*5
bb2.p=0

bb3.x =8
bb3.y=300
bb3.w=100
bb3.h=9*3
bb3.p=0


bb4.x =8
bb4.y=200
bb4.w=50
bb4.h=9*2
bb4.p=0





Sound(523, 60)  'C5
put (0,0),images,pset
Sound(587, 60)  'D5
Sound(659, 60)  'E5
Sound(698, 60)  'F5
Sound(784, 60)  'G5
Sound(880, 60)  'A5
Sound(988, 60)  'B5
Sound(1046, 60) 'C6


do
if inkey<> "" then exit do
sleep 1
drawBar bb
drawBar bb2
drawBar bb3
drawBar bb4
if bb.p=100 then exit do
bb.p=bb.p+1
bb2.p=bb.p
bb3.p=bb.p
bb4.p=bb.p

loop
cls