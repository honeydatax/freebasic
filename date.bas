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
                
type clock
          x as integer
          y as integer
          r as integer
          h as integer
          m as integer
          s as integer
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
                
sub drawclock(c as clock)
          dim pi as double= 3.1415927
          dim xx1 as double
          dim yy1 as double
          dim xx3 as double
          dim yy3 as double
          dim xx2 as double
          dim yy2 as double
          dim x as integer
          dim y as integer
          view (c.x-c.r,c.y-c.r)-(c.x+c.r,c.y+c.r)
          circle (c.r,c.r),c.r,rgb(128,128,128),,,1.0,f
          xx2=c.s                
          xx3=c.r                
          xx1=xx3+(xx3*0.8)*sin(xx2/30*pi)
                          
          yy1=xx3-(xx3*0.8)*cos(xx2/30*pi)
          x=xx1                
          y=yy1                
          line (c.r,c.r)-(x,y),rgb(255,255,255)
          xx2=c.m                
          xx1=xx3+(xx3*0.5)*sin(xx2/30*pi)
                          
          yy1=xx3-(xx3*0.5)*cos(xx2/30*pi)
          x=xx1                
          y=yy1                
          line (c.r,c.r)-(x,y),rgb(0,0,255)
          xx2=c.h                
          if xx2 > 12.0 then xx2=xx2-12.0
          xx1=xx3+(xx3*0.2)*sin(xx2/6*pi)
                          
          yy1=xx3-(xx3*0.2)*cos(xx2/6*pi)
          x=xx1                
          y=yy1                
          line (c.r,c.r)-(x,y),rgb(0,0,0)
                          
          View (0,0)-(639,479)
end sub                
                
#include "vbcompat.bi"
dim bb as button
dim x as integer
dim y as integer
Dim a As Double, b As Double
dim w as integer
dim cc as clock
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
                
cc.x=100                
cc.y=300                
cc.r=75                
do                
                          
          a = Now                
          cc.h=Hour(a)
          cc.m=minute(a)
          cc.s=second(a)
          s=date                
          bb.s=s                
          drawButton bb
          drawclock cc
          sleep 1000
          if inkey$<>"" then exit do
loop                
cls                
